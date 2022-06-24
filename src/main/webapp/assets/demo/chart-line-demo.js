// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Area Chart Example
new Chart(document.getElementById("myLinechart"), {
  type: 'line',
  data: {
    labels: [5,6,7,8,9,10,11,12],
    datasets: [{ 
        data: [86,114,106,106,107,111,133,221],
        label: "Q1",
        borderColor: "#3e95cd",
        fill: false
      }, { 
        data: [282,350,411,502,635,809,947,1402],
        label: "Q2",
        borderColor: "#8e5ea2",
        fill: false
      }, { 
        data: [168,170,178,190,203,276,408,547],
        label: "Q3",
        borderColor: "#3cba9f",
        fill: false
      }, { 
        data: [40,20,10,16,24,38,74,167],
        label: "Q4 ",
        borderColor: "#c45850",
        fill: false
      }
    ]
  },
  options: {
    title: {
      display: true,
      text: 'Doanh Thu (Triệu VNĐ)'
    }
  }
});