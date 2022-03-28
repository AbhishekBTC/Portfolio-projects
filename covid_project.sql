select *
 from coviddataset.deaths
order by 3,4;
select count(total_deaths_per_million) from coviddataset.deaths;
-- Select Data that we are going to be using
 
 Select location, date, total_cases, new_cases, total_deaths, population
 from coviddataset.deaths
 order by 1,2;
 
 -- Looking at Total Cases vs Total Deaths
 -- Shows likelihood of dying if you contract covid in your country
 Select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
 from coviddataset.deaths
 where location like '%Africa%'
 order by 1,2;
 
 -- Looking at Total Cases vs Population
 
 select location, date, population, total_cases, (total_cases/population)*100 as DeathPercentage
 from coviddataset.deaths
 where location like '%Africa%'
 order by 1,2;
 
 -- Looking at countries with Highest Infection Rate Compared to Population
 select location, population, max(total_cases) as HighestInfectionCount, max(total_cases/population)*100 
 as PercentPopulationInfected
 from coviddataset.deaths
 -- where location like '%Africa%'
 group by location, population
 order by PercentPopulationInfected desc;
 
 -- Showing Countries with Highest Death Count per population
 select location, max(cast(total_deaths As float)) as TotalDeathCount
 from coviddataset.deaths
 where continent is not null
 group by location
 order by TotalDeathCount desc;
 
-- Breaking Things Down By Continent

-- Showing continents with the highest death count per population
select continent, max(cast(total_deaths as float)) as TotalDeathCount
from coviddataset.deaths
where continent is not null
group by continent
order by TotalDeathCount desc;

-- Global Numbers
select sum(new_cases) as total_cases, sum(cast(new_deaths as float)) as total_deaths, sum(cast(new_deaths as float))/sum(new_cases)*100 as DeathPercentage
from coviddataset.deaths
 -- location like '%Africa%' 
where continent is not null
-- Group by date
order by 1,2





 
 
 
 
 
 

