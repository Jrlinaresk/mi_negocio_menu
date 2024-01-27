String calculatePercentageChange(double lastPrice, double currentPrice) {
  double percentageChange = ((lastPrice - currentPrice) / lastPrice) * 100;

  if (percentageChange > 0) {
    return '${percentageChange.round()}%';
  } else if (percentageChange < 0) {
    return '${percentageChange.round()}%';
  } else {
    return '0%';
  }
}
