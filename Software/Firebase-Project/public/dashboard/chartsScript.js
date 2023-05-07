// Note: changes to the plugin code is not reflected to the chart, because the plugin is loaded at chart construction time and editor changes only trigger an chart.update().
const plugin = {
    id: 'plugin',
    bevoreDraw(chart, args, plugins) {
        const { ctx, chartArea: { top, bottom, left, right, width, height } } = chart;
        ctx.save();
        ctx.fillStyle = 'rgba(0, 0, 200, 1)';
        ctx.fillRect(left, top, width, height);
    }
};
let chart = new Chart(document.getElementById("myFirstChart"), {
    type: 'line',
    data: {
        labels: ["07.05.2023 - 10:20", "07.05.2023 - 10:25", "07.05.2023 - 10:30", "07.05.2023 - 10:35", "07.05.2023 - 10:40", "07.05.2023 - 10:45"],
        datasets: [{
            label: "Battery1 1s",
            data: [
                4.2,
                3.7,
                4.0,
                4.1,
                4.0,
                3.8
            ],
            color: 'rgba(0, 0, 200, 0.4)',
            borderColor: 'rgba(0, 0, 255, 1)'
        }, {
            label: "Battery1 2s",
            data: [
                7.4,
                7.2,
                7.0,
                7.2,
                6.9,
                7.0
            ],
            color: 'rgba(200, 0, 0, 0.4)',
            borderColor: 'rgba(255, 0, 0, 1)'
        }
        ]
    },
    options: {
        animation: {
            duration: 500, // general animation time
        },
        hover: {
            animationDuration: 0, // duration of animations when hovering an item
        },
        scales: {
            y: {
                beginAtZero: true
            }
        },
        plugins: [plugin],
    }
});
