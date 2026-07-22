#!/usr/bin/env python3
"""Подсчет чистого дохода в год. """
import sys


def calc_netto(gross: int, ndfl: int) -> int:
    """Перевести гросс оклад в нетто.
    gross - оклад до вычета налогов;
    ndfl - процентная ставка НДФЛ.
    """
    return int(gross - (gross / 100 * ndfl))


per_month = int(sys.argv[1])
gross = 0
net = 0

# (предел дохода, ставка НДФЛ)
limits = [(2400000, 13), (5000000, 15), (20000000, 18), (50000000, 20), (sys.maxsize, 22)]
i = 0

for month in range(12):
    limit, ndfl = limits[i]

    if gross + per_month < limit:
        income = calc_netto(per_month, ndfl)
    else:
        i += 1
        income = calc_netto(limit - gross, ndfl)
        _, ndfl = limits[i]
        income += calc_netto(gross + per_month - limit, ndfl)

    print(f"Месяц {month+1}: {income}")

    gross += per_month
    net += income


print("-----")
print(f"Итого доход")
print(f"В год (gross): {gross}")
print(f"В год (net): {net}")
print(f"В среднем доход в месяц (net): {net/12:.2f}")
