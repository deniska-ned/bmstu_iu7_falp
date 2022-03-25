(load "src/det.lisp")
(load "src/det-new.lisp")
(load "src/gauss.lisp")

(defvar m20x20 '(( 5 -5 -5  5 -2  3 -3  1  5  4  0 -2  3  2  4  5  3 -1 -1  2)
                 ( 3 -1 -4 -4  2  2 -4  1 -4 -2  1 -5  1 -2 -5  2  1  1 -4 -4)
                 ( 3 -4 -5 -5 -1 -4  2 -1 -1 -4  1 -1  2 -4  3  0 -1  5  1 -4)
                 ( 2  4  5 -5 -4  0  3 -4 -2  2 -1  3  4 -2 -3  5 -2  2  4  3)
                 (-2 -4 -5 -1 -4  4 -5 -3  3 -3 -4 -3 -2 -4  5  4 -4  5  3  5)
                 (-3 -5  5 -4 -3  0  3 -4  1  5  2  2 -1 -3  4  5  1 -3 -4  1)
                 ( 5  3  4 -1  1  2 -1  0  4 -4  5 -2 -4 -2  5  5  1  2 -3  5)
                 ( 3  5  1 -5  2  1  1  5 -1 -2  4  4  3 -4  3  3  2  0  4 -5)
                 (-1  2  2  2 -5 -1 -5 -1 -3  4  4  4  1  2  4  1 -2  2  4 -4)
                 ( 3 -4  5  3 -4 -5 -2 -3 -4 -5 -5  5 -3  3  1 -2 -2  1  1 -2)
                 ( 1 -2  2 -5 -2  4  0 -5 -4  1 -1  5  3 -4  5 -4  5  0 -5  4)
                 ( 4 -1 -4 -4  0  4  3  2  3  2  2 -5 -1 -1  2  0  4  2 -2 -5)
                 (-2 -2 -2 -5  2  4 -5  5 -4 -2  3 -5  1 -2 -1  4  0 -4 -1  2)
                 ( 3 -5 -2  0 -3 -2 -2  3  0  2 -1 -4 -5 -5  2 -1  3  2  3 -3)
                 (-1 -5  1  1 -3 -2 -1 -1 -2 -3 -3 -4  0  4 -3  3  4  5  5 -2)
                 ( 1 -5 -5 -2 -2 -4  0  2  0 -5 -3 -2  3 -5  2 -4  1  4 -2  1)
                 (-4  0 -3  3  4  3 -1 -2  3 -4  0  0  4  5  2 -4 -4 -4  5 -2)
                 (-1 -2 -1 -3  4  5  5  2  4  1 -1 -2  2  3 -2  1  5  0  1 -2)
                 ( 5 -3  5 -1 -5  1  0  1 -3 -4  5 -4 -5 -5 -3  5 -3 -5  4 -2)
                 ( 2  2  4 -3  4  3  2 -4  3  1 -2  3  4 -3 -2  3 -3  5 -5  4)))

(defvar m15x15 '((-3.41  0  4 -1 -2  0 -4  5  3  3  5 -4  2  5 -2)
                 (-2  3.41  5 -3  3 -3 -5 -2 -3  2 -2 -5 -2 -3 -1)
                 (-4  5  3  4  4  3 -5 -2  1 -5  5 -2 -2  2  0)
                 (-3 -4 -3.41 -5  0  2  1  4  5  2 -4  2 -2  0  2)
                 (-5 -2 -2  0  5 -4 -1 -2 -5 -3 -3  5 -4  0 -4)
                 ( 2 -4  5 -3.41  4  2  0  5  3 -1 -3  2  1 -4 -5)
                 ( 5  0 -4 -3 -5 -1 -3  3 -5  0  4  2  2 -4  4)
                 ( 4  1  0  5 -2  5  5  3  0  5  5 -5  3  2 -1)
                 (-4 -2  2 -5  5 -3 -4 -1 -1  4  3  2 -1 -2  5)
                 ( 4  4 -4  2 -1  3  4  1  3 -3  2  4 -5 -2  0)
                 ( 2 -5  5  2  4  2  4  3  4  2  1 -3 -2  0  5)
                 ( 4 -1 -2 -5  1  0 -2  1  2  4 -5 -3  1  1  4)
                 (-1  4 -1 -3 -2  0  4  3 -1  0  2 -3  5  0  4)
                 (-3 -4  4 -4  0 -3 -1  1  5  5 -5  5 -2  0  2)
                 ( 0 -3 -2  2  3 -3 -3 -4 -1 -4 -1  1 -4  3  3)))

(defvar m10x10 '((-3  5  2  3  4 -5  3 -3  1 -2)
                 (-3 -2  2 -2  0 -3 -2  3 -2  1)
                 (-3 -5 -4 -5  1  3 -2 -1  0 -3)
                 (-5 -1 -3 -3 -1  5 -2 -2  5 -4)
                 ( 4 -3  0 -1 -1  3 -4  4  3  3)
                 (-3  1  0  5  5  4  2  3 -3  0)
                 ( 1  3  0  4  2  0  0 -5 -5 -3)
                 (-1  4 -3  5  5 -2 -3 -3 -1 -5)
                 (-3  5 -2 -4  5  0  5 -2 -5 -5)
                 (-2  3  1 -2 -5 -4  5 -4 -1 -1)))

(defvar m20x20-new '(( 95.0  -23  -27  -71  -72  -47   20  -69   39 -63   90  76   55   43  -78   47  -68   38  -56   66)
                     (-52  -85   94    8   72   31  -89   13   62  -5    6  64   36   -9  -42    6    0  -31  -50   45)
                     (-94  -65   10   82  -96  -62  -97  -39   91  80   94 -69   10  -25   56  -38  -31   22  -75  -82)
                     ( 26   60   72   70  -60  -44   -8   43  -47 -15  -64 -30   55    4   50   12  -97   -5   83   76)
                     ( 65   -3  -98   59  -37   89  -58   42   20 -56  -93 -54  -29  -54   83    9   90   78   93  -64)
                     ( 48   58   93  -18   54   89  -14  -69   35 -44   67 -84  -42  -25  -36   59  -24   52    5   88)
                     (-48   91   45  -74  -44   -3    6   52    1  76  -66 -15  -67  -59   74  -51  -41   15   54   47)
                     ( 54   55  -82  -13  -72    2  -21  -16  -85  -6   71 -11  -82   31   98   33  -90  -71  -89   21)
                     (-56  -38   85  -67  -84   16   51  -84  -75  27  -51  81  -68  -37   11  -72  -18   68  -68  -98)
                     (-28   90   45  -23   -4    7  -78   34  -97 -48  -24  60   36  -95  -75  -59  -48   60   11  -32)
                     ( 87  -21  -92  -95  -79  -22  -16   33  -42 -38   81 -55  -62    8   61   19   30  -77  -11   72)
                     ( 69   94   24   27  -50   54   66   -5   29 -27   57 -16  -53  -48   -7  -59  -28   11   53   52)
                     (-52   38   73   -8  -12   61  -66    2  -17 -79  -72  18   35   16  -46   86  -92  -46  -30  -62)
                     ( 55    5  -56  -76  -18  -52   70  -48   79 -68  -26 -36   31   -2   93   -9  -86   50   74   87)
                     (-93   87  -37   51  -44   69    5   30   54  10   72 -55  -23   73    8   76  -32  -93   70  -23)
                     ( 29  -32    8 -100   -3   85   27  -35  -39   9  -59 -83   46   39   41   43  -79  -67    6   96)
                     ( 66   85  -61   43  -29  -22   94   95  -78 -31   37  83   39  -77   10   17  -41   45  -10   34)
                     (-15   96   44   45   80  -44   31   90   31  41  -14   4  -42  100  -40  -91   60   73   71   12)
                     ( 89  -47 -100   55  -45   73   40  -63   69  10   37   7   88  -44   65  -39  -10  -87    0   69)
                     (-22  -62   47  -85  -84   43  -24  -19   92 -48   83  90  -62   30   -4   28   89  -85   34   28)))

(defvar v20-new '(71  -64  -72  -60   17   -1    0   -9   -3  -82   11  -41   61  -14  -97  -48  -79   -1    0   52))

;array([ 0.77073939,  1.28249332,  0.25003568, -0.32010996, -0.31895146,
;       -0.73277061, -0.05228008, -0.70309617,  0.80196287,  0.05991162,
;       -1.08613502, -0.00605156,  0.21544935,  0.00896563, -0.06653615,
;        0.50850599,  1.24570269, -0.56650407, -1.01928877, -0.22776693])

(defun main ()
  (princ "Hi"))


(main)