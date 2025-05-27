import sys

# Expected rounded values
expected = [1.8, 1.8, 1.8, 0.0, 1.8, 1.8]

def read_measure_file(filename):
    results = []
    with open(filename, 'r') as f:
        for line in f:
            if '=' in line:
                try:
                    # Extract value after '=' and before 'from'
                    val_str = line.split('=')[1].split('from')[0].strip()
                    val = float(val_str)
                    rounded_val = round(val, 1)
                    results.append(rounded_val)
                except (IndexError, ValueError):
                    continue  # Skip malformed lines
    return results

def main():
    if len(sys.argv) < 2:
        print("Usage: python check_meas.py <measure_file>")
        sys.exit(1)

    filename = sys.argv[1]
    values = read_measure_file(filename)

    if values == expected:
        print("PASS")
        sys.exit(0)
    else:
        print("FAIL")
        print(f"Expected: {expected}")
        print(f"Got     : {values}")
        sys.exit(1)

if __name__ == "__main__":
    main()

