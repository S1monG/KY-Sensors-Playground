""" 
Run like:
python lut_generator <LUT_ENTRIES> <PRECISION>

To be compatible with sine_wave.v, LUT_ENTRIES should 
be a power of 2 and PRECISION should be a multiple of 4
"""
import argparse
import math

def generate_lut(LUT_ENTRIES, PRECISION):
    max_value = 2**PRECISION - 1 # from 0 to 2^4-1

    with open('sine_lut.mem', 'w') as f:
        for i in range(LUT_ENTRIES):
            angle = 2*math.pi* i / LUT_ENTRIES
            value = round((math.sin(angle)+1) * (max_value/2))
            f.write(f'{value:X}\n')

def visualize_lut(filename='sine_lut.mem'):
    import matplotlib.pyplot as plt
    import numpy as np
    with open(filename, 'r') as f:
        values = [int(line.strip(), 16) for line in f.readlines()]
    x = np.linspace(0, 2 * np.pi, len(values))

    plt.plot(x, values)
    plt.title("Sine Wave from LUT")
    plt.xlabel("Angle (radians)")
    plt.ylabel("Amplitude")
    plt.grid()
    plt.show()

if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Script that generates a look up table to be used with sine_wave.v"
    )
    parser.add_argument("LUT_ENTRIES", type=int, help="Number of entries in look up table")
    parser.add_argument("PRECISION", type=int, help="Precision = number of bits per entry")
    args = parser.parse_args()
    PRECISION = args.PRECISION
    LUT_ENTRIES = args.LUT_ENTRIES

    generate_lut(LUT_ENTRIES, PRECISION)
    # visualize_lut()
