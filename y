import React from 'react';
import { Dimensions, View } from 'react-native';
import { WebView } from 'react-native-webview';

const { width } = Dimensions.get('window');

const EChartComponent = () => {
  const option = {
    tooltip: {
      trigger: 'axis',
      axisPointer: {
        type: 'cross',
      },
    },
    xAxis: {
      type: 'category',
      boundaryGap: false,
      data: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'],
    },
    yAxis: {
      type: 'value',
    },
    series: [
      {
        name: 'Your Weight',
        type: 'line',
        smooth: true,
        data: [220, 210, 200, 195, 185, 180, 175],
        lineStyle: {
          color: '#FF6A4D',
          width: 3,
        },
        areaStyle: {
          color: '#FFD6D1',
        },
        itemStyle: {
          color: '#FF6A4D',
        },
      },
      {
        name: 'Restrictive Diet',
        type: 'line',
        smooth: true,
        data: [220, 218, 215, 212, 210, 208, 205],
        lineStyle: {
          color: '#A57A4D',
          width: 3,
        },
        areaStyle: {
          color: '#D8B998',
        },
        itemStyle: {
          color: '#A57A4D',
        },
      },
    ],
  };

  const html = `
    <html>
    <head>
      <script src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>
    </head>
    <body>
      <div id="main" style="width: ${width}px; height: 400px;"></div>
      <script>
        var myChart = echarts.init(document.getElementById('main'));
        var option = ${JSON.stringify(option)};
        myChart.setOption(option);
      </script>
    </body>
    </html>
  `;

  return (
    <View style={{ flex: 1 }}>
      <WebView
        originWhitelist={['*']}
        source={{ html }}
        style={{ height: 400 }}
      />
    </View>
  );
};

export default EChartComponent;
