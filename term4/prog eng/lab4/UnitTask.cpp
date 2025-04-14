//---------------------------------------------------------------------------
#pragma hdrstop
#include <algorithm>
#include "UnitTask.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)

// —писок городов, где доход на душу населени€ выше заданного
std::vector<City> UserTask::getCitiesAboveIncomePerCapita(double threshold) const {
	std::vector<City> result;
	for (const auto& city : cities) {
		double incomePerCapita = city.budget / city.population;
		if (incomePerCapita > threshold) {
			result.push_back(city);
		}
	}
	return result;
}

// ¬о сколько раз отличаютс€ города по доходу на душу населени€
double UserTask::getIncomePerCapitaRatio() const {
	if (cities.empty()) return 0.0;

	double minIncome = std::numeric_limits<double>::max();
	double maxIncome = std::numeric_limits<double>::min();

	for (const auto& city : cities) {
		double incomePerCapita = city.budget / city.population;
		minIncome = std::min(minIncome, incomePerCapita);
		maxIncome = std::max(maxIncome, incomePerCapita);
	}

	if (minIncome == 0) return 0.0; // »збегаем делени€ на ноль
	return maxIncome / minIncome;
}
