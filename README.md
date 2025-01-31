Description of Data Files



HUMAN SUBJECTS

Rows: Every .mat file contains 49 rows, representing different trials in the experiment. This is consistent across all subjects, regardless of viewing time.
In one experiment, each subject saw 17 upright, 17 rotated-correct, and 15 rotated-incorrect poses.

Columns:
1. REAL OBJECT: ImageNet class index number of the object shown
2. ALTERNATIVE LABEL: ImageNet class index number of the alternative object
3. POSE: 0 = upright, 1 = rotated-correct, 2 = rotated-incorrect
4-6. ROTATION: X, Y, Z rotation angles
7. CORRECT ANSWER KEY: 1 = left key, 2 = right key
8. SUBJECT'S ANSWER: Key pressed by the subject*
9. VIEWING TIME: Time the subject viewed the image**
10. RESPONSE TIME: Time it took the subject to answer

* if 7 == 8: subject answered correctly, if 7 =! 8: subject answered incorrectly, if 7 & 8 == 0: subject mis-clicked

** For subjects 13-24, column 9 (viewing time) is set to 0 because these subjects saw the image and the labels simultaneously.	

Note, for the analysis in the paper, we used the unlimited viewing time data from subjects 13-24. However, the performance did not significantly
differ from that of subjects 1-12, who first viewed the image (as long as they wanted) and then answered. 


--------------


NETWORKS

Rows: Every .mat file contains 147 rows, representing different trials. This is consistent across all networks. 
In the experiment, each network saw 51 upright, 51 rotated-correct, and 45 rotated-incorrect poses.

Columns:
1. REAL OBJECT: ImageNet class index number of the object shown
2. ALTERNATIVE LABEL: ImageNet class index number of the alternative object
3. POSE: 0 = upright, 1 = rotated-correct, 2 = rotated-incorrect
4. NETWORK'S ANSWER: 0 = incorrect, 1 = correct, 2 = could not answer
