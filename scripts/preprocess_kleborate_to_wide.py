import csv

# Should we clean the allele variants or not?
TRUNCATE = True

def clean(token):
    if not TRUNCATE:
        return token

    if ' ' in token:
        token = token.split()[0]

    while token[-1] in '*^?':
        token = token[:-1]

    return token

with open("../raw/Klebsiella pneumoniae__kleborate.csv", 'r') as fp:
    reader = csv.reader(fp)
    header = reader.__next__()
    samples = [row for row in reader]

ARGs = [i for i,val in enumerate(header) if val.endswith("_acquired")]

tokens = set()

for sample in samples:
    for i in ARGs:
        for token in sample[i].split(';'):
            tokens.add(clean(token))

new_header = sorted(tokens - {'-'}, key=str.upper)

with open("../clean/kleborate_wide_binary.csv", 'w') as fp:
    writer = csv.writer(fp)
    writer.writerow(["Genome.id"] + new_header)

    for sample in samples:
        args_in_sample = (sample[i] for i in ARGs)
        ARGs_present = set(";".join(args_in_sample).split(';'))
        ARGs_present = set(map(clean, ARGs_present))
        new_row = [sample[0]] + [int(arg in ARGs_present) for arg in new_header]
        writer.writerow(new_row)
