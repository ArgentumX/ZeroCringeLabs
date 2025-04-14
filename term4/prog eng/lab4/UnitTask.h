//---------------------------------------------------------------------------
#ifndef UnitTaskH
#define UnitTaskH

#include <vector>
#include <string>

bool mode = true;

struct City {
    std::string name;
    double population;
    double budget;
    City() : name(""), population(0.0), budget(0.0) {} // Конструктор по умолчанию
    City(const std::string& n, double p, double b)
        : name(n), population(p), budget(b) {}
};

class UserTask {
public:
	std::vector<City> cities;

    UserTask() {}
    void addCity(const std::string& name, double population, double budget) {
        cities.emplace_back(name, population, budget);
    }
	void clear() {
        cities.clear();
	}

	std::vector<City> getCitiesAboveIncomePerCapita(double threshold) const;
	double getIncomePerCapitaRatio() const;

};
//---------------------------------------------------------------------------
#endif
