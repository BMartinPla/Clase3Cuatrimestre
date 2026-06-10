
function updateClock() {
    const now = new Date();

    const hours = String(now.getHours()).padStart(2, '0');
    const minutes = String(now.getMinutes()).padStart(2, '0');
    const seconds = String(now.getSeconds()).padStart(2, '0');
    document.getElementById('time').textContent = `${hours}:${minutes}:${seconds}`;

    const dateOptions = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
    const dateString = now.toLocaleDateString('es-AR', dateOptions);
    document.getElementById('date').textContent = dateString;
}

function getWeatherIcon(weatherCode) {
    if (weatherCode === 0) return '☀️'; 
    if (weatherCode >= 1 && weatherCode <= 3) return '⛅'; 
    if (weatherCode >= 45 && weatherCode <= 48) return '🌫️'; 
    if (weatherCode >= 51 && weatherCode <= 67) return '🌧️'; 
    if (weatherCode >= 71 && weatherCode <= 77) return '❄️'; 
    if (weatherCode >= 80 && weatherCode <= 82) return '🌦️'; 
    if (weatherCode >= 95 && weatherCode <= 99) return '⛈️'; 
    return '🌍';
}

async function fetchWeather() {
    const lat = -33.33;
    const lon = -60.22;
    
    try {
        const response = await fetch(`https://api.open-meteo.com/v1/forecast?latitude=${lat}&longitude=${lon}&current_weather=true`);
        const data = await response.json();
        
        const temp = Math.round(data.current_weather.temperature);
        const code = data.current_weather.weathercode;
        
        document.getElementById('weather-temp').textContent = `${temp}°C`;
        document.getElementById('weather-icon').textContent = getWeatherIcon(code);
    } catch (error) {
        console.error("Error obteniendo el clima:", error);
        document.getElementById('weather-temp').textContent = '--°C';
        document.getElementById('weather-icon').textContent = '⚠️';
    }
}

updateClock();
fetchWeather(); 

setInterval(updateClock, 1000); 
setInterval(fetchWeather, 1800000); 