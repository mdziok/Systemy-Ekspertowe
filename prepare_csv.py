import csv

with open("baza.pl") as file:
    baza = file.readlines()

links = []
names = []
for line in baza:
    if line.startswith('/* https'):
        links.append(line.split(' ')[1])
    if line.startswith('opona'):
        names.append(line.replace(')', '(').split('(')[1])
link_dict = {}
with open("baza.csv", 'w+', newline='') as file:
    writer = csv.writer(file)
    for key, value in zip(names, links):
        name = ' '.join(x.capitalize() for x in key.replace('c_', 'Continental_').split('_'))
        writer.writerow([key, value, name])
        link_dict[key] = value
        

print(link_dict)