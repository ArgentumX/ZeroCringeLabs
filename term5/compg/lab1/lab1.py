import math
from tkinter import N
import matplotlib.pyplot as plt
import numpy as np
import random


def draw_line(vp, x0, y0, x1, y1):
    # Округляем координаты
    x0, y0, x1, y1 = int(round(x0)), int(round(y0)), int(round(x1)), int(round(y1))

    # Проверяем крутизну
    steep = abs(y1 - y0) > abs(x1 - x0)

    # Обмен X, Y если угол наклона более 45º
    if steep:
        x0, y0 = y0, x0
        x1, y1 = y1, x1

    # Приводим к базовой форме (x0 < x1)
    if x0 > x1:
        x0, x1 = x1, x0
        y0, y1 = y1, y0

    # Вычисляем разности
    dx = x1 - x0
    dy = abs(y1 - y0)

    # Удвоенные значения
    dx2 = dx + dx
    dy2 = dy + dy

    # Инициализация ошибки
    d = -dx

    # Определяем шаг по Y
    y_step = 1 if y0 < y1 else -1

    # Инициализация текущих координат
    y = y0
    x = x0
    col = np.random.randint(0, 255, 3)
    # Основной цикл
    while x <= x1:
        # Определяем координаты пикселя с учетом обмена
        if steep:
            xp, yp = y, x  # Обмен координат
        else:
            xp, yp = x, y

        # Проверяем границы и закрашиваем пиксель
        if 0 <= xp < vp.shape[1] and 0 <= yp < vp.shape[0]:
            vp[yp, xp] = col

        # Обновляем ошибку
        d += dy2

        # Корректируем Y если нужно
        if d > 0:
            y += y_step
            d -= dx2

        # Двигаемся по X
        x += 1


class ParabolaGrid:
    def __init__(self, draw_nodes=True, draw_edges=True,
                 height=800, width=850, rows=6, cols=6, node_size=10):
        """
        Класс для построения сетки внутри параболы.
        Требуется определение функции bresenham_line(vp, x1, y1, x2, y2).
        """

        # параметры изображения и сетки
        self.draw_nodes = draw_nodes
        self.draw_edges = draw_edges
        self.height = height
        self.width = width
        self.rows = rows
        self.cols = cols
        self.node_size = node_size

        # координаты узлов по сетке
        self.grid_x = [int(round(x)) for x in np.linspace(0, width - 1, cols)]
        self.grid_y = [int(round(y)) for y in np.linspace(0, height - 1, rows)]

        # шаги сетки
        self.x_step = self.grid_x[1] - self.grid_x[0] if cols > 1 else max(1, width)
        self.y_step = self.grid_y[1] - self.grid_y[0] if rows > 1 else max(1, height)

        # допуски и шум
        self.accuracy = max(1, (abs(self.x_step) + abs(self.y_step)) // 4)  # насколько близко к параболе
        self.noise_strength = max(0, (abs(self.x_step) + abs(self.y_step)) // 20)  # сила случайного сдвига

        # половина квадрата-узла
        self.half_size = self.node_size // 2

        # коэффициент параболы (вершина в центре, низ внизу изображения)
        denom = ((width - 1) / 2) ** 2 if width > 1 else 1.0
        self.coeff_a = -(height - 1) / denom

    # --- вспомогательные методы ---

    def f(self, x):
        """Вычисление y по параболе"""
        return self.coeff_a * (x - (self.width - 1) / 2) ** 2 + (self.height - 1)

    def place_node(self, x, y, add_noise=False):
        """Смещает узел (по желанию с шумом), затем ограничивает по границам"""
        dx = random.randint(-self.noise_strength, self.noise_strength) if add_noise else 0
        dy = random.randint(-self.noise_strength, self.noise_strength) if add_noise else 0
        new_x = int(round(x + dx))
        new_y = int(round(y + dy))
        # ограничение в пределах картинки
        new_x = min(max(new_x, self.half_size), self.width - 1 - self.half_size)
        new_y = min(max(new_y, self.half_size), self.height - 1 - self.half_size)
        return new_x, new_y

    def draw_square(self, canvas, x, y, color):
        """Отрисовка маленького квадратика-узла"""
        canvas[y - self.half_size:y + self.half_size + 1,
               x - self.half_size:x + self.half_size + 1] = color

    # --- основной метод ---

    def generate(self):
        """Строит сетку внутри параболы и возвращает картинку numpy"""
        bg_color = (255, 255, 255)
        canvas = np.full((self.height, self.width, 3), bg_color, dtype="uint8")

        # списки для хранения информации о точках
        nodes = []              # все узлы
        parabola_nodes = []     # узлы на параболе
        node_map = {}           # (i,j) -> (x, y) для быстрого доступа к соседям

        # --- генерация узлов ---
        for j, y in enumerate(self.grid_y):
            for i, x in enumerate(self.grid_x):
                y_par = self.f(x)

                # 1) если точка лежит на параболе (контур)
                if abs(y - y_par) <= self.accuracy:
                    cx, cy = self.place_node(x, y, add_noise=False)
                    nodes.append((i, j, cx, cy))
                    parabola_nodes.append((i, j, cx, cy))
                    node_map[(i, j)] = (cx, cy)
                    continue

                # 2) верхний ряд всегда добавляется (без шума)
                if j == 0:
                    cx, cy = self.place_node(x, y, add_noise=False)
                    nodes.append((i, j, cx, cy))
                    node_map[(i, j)] = (cx, cy)
                    continue

                # 3) внутренние точки (выше параболы)
                if y < y_par:
                    cx, cy = self.place_node(x, y, add_noise=True) 

                    # проверка: если после шума точка "упала" ниже параболы → поднять обратно
                    y_par_at_cx = self.f(cx)
                    max_allowed_y = int(math.floor(y_par_at_cx)) - 1
                    if cy > max_allowed_y:
                        correction = random.randint(0, max(1, self.noise_strength // 2))
                        cy = max(self.half_size, min(max_allowed_y - correction,
                                                     self.height - 1 - self.half_size))

                    nodes.append((i, j, cx, cy))
                    node_map[(i, j)] = (cx, cy)
                    continue

                # 4) точки ниже параболы → пропуск

        # --- отрисовка узлов ---
        if self.draw_nodes:
            for _, _, cx, cy in nodes:
                color = [random.randint(0, 255) for _ in range(3)]  # случайный цвет узла
                self.draw_square(canvas, cx, cy, color)

        # --- отрисовка рёбер ---
        if self.draw_edges and node_map:
            # соединяем соседние узлы
            for (i, j), (cx, cy) in list(node_map.items()):
                for di, dj in ((1, 0), (-1, 0), (0, 1), (0, -1)):
                    neighbor = (i + di, j + dj)
                    if neighbor in node_map:
                        nx, ny = node_map[neighbor]
                        draw_line(canvas, cx, cy, nx, ny)

            # соединяем узлы вдоль параболы
            if parabola_nodes:
                parabola_nodes_sorted = sorted(parabola_nodes, key=lambda p: p[2])  # сортировка по x
                for k in range(len(parabola_nodes_sorted) - 1):
                    x1, y1 = parabola_nodes_sorted[k][2], parabola_nodes_sorted[k][3]
                    x2, y2 = parabola_nodes_sorted[k + 1][2], parabola_nodes_sorted[k + 1][3]
                    draw_line(canvas, x1, y1, x2, y2)

        return canvas


plt.axis('off')
vp = ParabolaGrid(rows=7, cols=7).generate()
plt.imshow(vp)
plt.show()


