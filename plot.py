import matplotlib.pyplot as plt
import pandas
import os

CSVSPATH = "csvs/"
PLOTSPATH = "plots/"

for f in os.listdir(CSVSPATH):
    df = pandas.read_csv(CSVSPATH + f)
    metrics = df.groupby("metric")
    for label, group in metrics:
        x = group["x"].tolist()
        y = group["y"].tolist()
        plt.plot(x, y, label=label)
    savePath = PLOTSPATH + f[0:-4] + ".png"
    plt.legend()
    plt.savefig(savePath)
    plt.clf()
    plt.cla()
    plt.close()

# x = range(1,10)
# plt.plot(x, [xi*1 for xi in x])
# plt.plot(x, [xi*2 for xi in x])
# plt.plot(x, [xi*3 for xi in x])
# plt.savefig("test.png")
