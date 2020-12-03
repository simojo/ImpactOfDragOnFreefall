import matplotlib.pyplot as plt
import pandas
import os

CSVSPATH = "csvs/"
PLOTSPATH = "plots/"
XLABEL = "Displacement (x)"
YLABEL = "Value"

for f in os.listdir(CSVSPATH):
    ## plotting
    domain = []
    df = pandas.read_csv(CSVSPATH + f)
    metrics = df.groupby("metric")
    for label, group in metrics:
        x = group["x"].tolist()
        y = group["y"].tolist()
        domain = x
        plt.plot(x, y, label=label)
        plt.xlabel(XLABEL)
        plt.ylabel(YLABEL)
        if "Down" in f:
            plt.xlim(max(x), min(x))
    ## /plotting

    ## parsing
    text = f[0:-4]
    words = text.split("_")
    direction = words[0].replace("Up", "Case 1").replace("Down", "Case 2")
    alias = words[1]
    velocityType = words[2]
    v_0 = "{:.2e}".format(float(words[3])).replace("+", "").replace("e00", "")
    ## /parsing

    ## title
    title = f"{direction} - {alias} - {velocityType} (Initial v: {v_0})"
    ## /title

    ## saving
    savePath = f"{PLOTSPATH}{title}.png".replace(" ", "")
    plt.title(title)
    plt.legend()
    plt.savefig(savePath)
    plt.clf()
    plt.cla()
    plt.close()
    ## /saving

# x = range(1,10)
# plt.plot(x, [xi*1 for xi in x])
# plt.plot(x, [xi*2 for xi in x])
# plt.plot(x, [xi*3 for xi in x])
# plt.savefig("test.png")
