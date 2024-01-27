String calculatePercentageChange(double lastPrice, double currentPrice) {
  int percentageChange = ((lastPrice - currentPrice) / lastPrice).toInt() * 100;

  if (percentageChange > 0) {
    return '${percentageChange.round()}%';
  } else if (percentageChange < 0) {
    return '${percentageChange.round()}%';
  } else {
    return '0%';
  }
}
