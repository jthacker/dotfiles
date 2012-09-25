from scipy.optimize import curve_fit
import numpy as np
from redis import Redis
import sys

def _minValueFailedFitFunc(initialGuess):
        size = len(initialGuess)
        popt = np.zeros(size)
        pcov = np.zeros((size,size))
        pcov[np.diag_indices_from(pcov)] = np.inf
        return popt,pcov
        
class Fitter(object):
    def __init__(self, fitFunc, failedFitFunc=_minValueFailedFitFunc):
        self._fitFunc = fitFunc
        self._failedFitFunc = failedFitFunc

    def fit(self, initialGuess, xdata, ydata):
        if np.isscalar(initialGuess):
            initialGuess = np.array(initialGuess)
        try:
            popt,pcov = curve_fit(self._fitFunc, xdata, ydata, initialGuess)
        except RuntimeError:
            popt,pcov = self._failedFitFunc(initialGuess)

        if np.isscalar(pcov):
            assert pcov == np.inf
            pcov = self._failedFitFunc(initialGuess)[1]

        return popt,pcov


class ProgressMeter(object):
    """Displays a CLI progress meter"""

    def __init__(self, maxVal, msg):
        self._progress = 0
        self._max = float(maxVal)
        self._msg = msg

    def _display(self):
        i = 100 * (self._progress / self._max)
        sys.stdout.write("\r%s - %d%%" % (self._msg, i))
        sys.stdout.flush()

    def increment(self):
        self._progress += 1
        self._display() 

    def finish(self):
        self._progress = self._max
        self._display()
        sys.stdout.write(" -- Finished!\n")
        sys.stdout.flush()
