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

    ## parsing
    text = f[0:-4]
    words = text.split("_")
    direction = words[0].replace("Up", "Up ").replace("Down", "Down ")
    alias = words[1]
    velocityType = words[2]
    v_0 = "{:.2e}".format(float(words[3])).replace("+", "").replace("e00", "")

    ## title
    title = f"{direction} - {alias} - {velocityType}\n(Initial v: {v_0})"

    ## saving
    savePath = f"{PLOTSPATH}{title}.png".replace("\n", "").replace(" ", "")
    plt.title(title)
    plt.legend()
    plt.grid(True)
    plt.savefig(savePath)
    plt.clf()
    plt.cla()
    plt.close()
