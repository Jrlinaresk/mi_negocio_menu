String calculatePercentageChange(int lastPrice, int currentPrice) {
  int percentageChange = ((currentPrice - lastPrice) / lastPrice).toInt() * 100;

  if (percentageChange > 0) {
    return '${percentageChange.round()}%';
  } else if (percentageChange < 0) {
    return '${percentageChange.round()}%';
  } else {
    return '0%';
  }
}
