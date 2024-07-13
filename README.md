# This repository contains an implementation of the K-Nearest Neighbors (KNN) algorithm, a fundamental machine learning technique.

## What does it do?
Let's suppose you have three groups of classes named A, B, and C, each containing data points. If you want to add a new data point and determine which group it should belong to, KNN can help you do this efficiently.

All the data points are represented on a Cartesian plane with coordinates. When we add a new data point, we need to determine its position by assigning coordinates to it. Once we have the coordinates of the new data point, the KNN algorithm calculates the distance between this new data point and all the existing data points on the plane.

Using the "K" nearest neighbors (i.e., the K data points closest to the new data point), we then determine the most common class among these neighbors. The new data point is assigned to this class.

# How to Install
To use this program, you need to install a few things first.

## What to Install
### Ruby Installation
You will need Ruby. You can install it by following the instructions at this URL: [Ruby Installation Documentation.](https://www.ruby-lang.org/en/documentation/installation/).
### Steps to set up the project
   You can use the any method you want to clone.
#### 1) clone this repository
```
   git clone https://github.com/iSgRuby/knn
```

#### 2) Install Dependencies:
   In the root of the project directory, run:
```
   bundle install
```

#### 3) Run the Program:
   In the root directory, execute the following command:
```
   ruby lib/main.rb
```

#### 4) Generate Groups:
Insert `option 5` to generate two groups.
After running this option, a file named `scatter_chart.png` will be generated in the root of the project.
You can also check the output files in the `./output/` folder.

#### 5) Add Points:
Insert `option 4` to add some points.
Enter the required information.
After adding points, check the `./output/knncheck.txt` file to see the K value and the newly generated points.
Also, review the updated scatter chart to see the new points.

#### 6) Continue Execution:
Insert any other option to continue with the program execution.
Check the `knncheck.txt` file for ongoing updates.

#### 7) Add More Groups:
Use `option 1` to add a new group.
After adding a group, use `option 2` to add points to this new group.
Once the points are added, use option 3 to load the chart and view your new group in the scatter chart.
