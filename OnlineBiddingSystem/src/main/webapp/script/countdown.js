// countdown.js
function initializeCountdowns() {
    const timers = document.querySelectorAll('.countdown-timer');
    
    timers.forEach(timer => {
        const startDate = new Date(timer.dataset.startDate);
        const endDate = new Date(timer.dataset.endDate);
        
        // Update immediately and every second
        updateTimer(timer, startDate, endDate);
        setInterval(() => updateTimer(timer, startDate, endDate), 1000);
    });
}

function updateTimer(element, startDate, endDate) {
    const now = new Date();
    let message = '';
    let textClass = '';
    
    if (now < startDate) {
        // Auction hasn't started
        const diff = startDate - now;
        message = `Starts in: ${formatCountdown(diff)}`;
        textClass = 'text-blue-600';
    } 
    else if (now < endDate) {
        // Auction ongoing
        const diff = endDate - now;
        message = `${formatCountdown(diff)}`;
        textClass = (diff < 86400000) ? 'text-orange-600' : 'text-green-600'; // 24 hours in ms
    } 
    else {
        // Auction ended
        message = 'Auction Closed';
        textClass = 'text-red-600 font-bold';
    }
    
    element.innerHTML = `<span class="${textClass}">${message}</span>`;
}

function formatCountdown(ms) {
    const days = Math.floor(ms / (86400000));
    const hours = Math.floor((ms % 86400000) / 3600000);
    const minutes = Math.floor((ms % 3600000) / 60000);
    const seconds = Math.floor((ms % 60000) / 1000);
    
    let result = '';
    if (days > 0) result += `${days}d `;
    if (hours > 0 || days > 0) result += `${hours}h `;
    result += `${minutes}m ${seconds}s`;
    return result;
}

// Initialize when DOM is loaded
document.addEventListener('DOMContentLoaded', initializeCountdowns);


function confirmDelete(url) {
    if (confirm("Are you sure you want to delete this item?")) {
        window.location.href = url;
    }
}