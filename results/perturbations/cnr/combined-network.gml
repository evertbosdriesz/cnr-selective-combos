graph [
  directed 1
  node [
    id 0
    label "EGFR"
    type "protein"
    x 0
    y 0
  ]
  node [
    id 1
    label "AKT1"
    type "protein"
    x -26
    y 35
  ]
  node [
    id 2
    label "GSK3"
    type "protein"
    x 26
    y 122
  ]
  node [
    id 3
    label "PRAS40"
    type "protein"
    x -26
    y 70
  ]
  node [
    id 4
    label "RS6"
    type "protein"
    x -26
    y 122
  ]
  node [
    id 5
    label "ERK1"
    type "protein"
    x 26
    y 70
  ]
  node [
    id 6
    label "CREB1"
    type "protein"
    x 43
    y 105
  ]
  node [
    id 7
    label "MEK1"
    type "protein"
    x 26
    y 35
  ]
  node [
    id 8
    label "P70S6K"
    type "protein"
    x 0
    y 105
  ]
  node [
    id 9
    label "AKTi"
    type "perturbation"
    x -70
    y 35
  ]
  node [
    id 10
    label "ERKi"
    type "perturbation"
    x 70
    y 70
  ]
  node [
    id 11
    label "IGF1Ri"
    type "perturbation"
    x -26
    y 0
  ]
  node [
    id 12
    label "PI3Ki"
    type "perturbation"
    x -70
    y 17
  ]
  node [
    id 13
    label "mTORi"
    type "perturbation"
    x -70
    y 70
  ]
  edge [
    source 0
    target 1
    weight 4.0651839423056
    color "#1c86ee"
    edgetype "local_response"
    penwidth 10.0
    deviation 1.0
    sign "positive"
    curved 0
    edgelabel "4.07/0.5"
    added 1
  ]
  edge [
    source 0
    target 7
    weight 1.0178735063356743
    color "gray"
    edgetype "local_response"
    penwidth 10.0
    deviation 0.0
    sign "positive"
    curved 0
    added 1
  ]
  edge [
    source 1
    target 2
    weight 0.05622145680803347
    color "gray"
    edgetype "local_response"
    penwidth 0.5622145680803347
    deviation 0.0
    sign "positive"
    curved 0
    added 1
  ]
  edge [
    source 1
    target 3
    weight 0.11768393556543874
    color "gray"
    edgetype "local_response"
    penwidth 1.1768393556543875
    deviation 0.0
    sign "positive"
    curved 0
    added 1
  ]
  edge [
    source 2
    target 1
    weight -2.253576462392827
    color "#1c86ee"
    edgetype "local_response"
    penwidth 10.0
    deviation 1.0
    sign "negative"
    curved 1
    edgelabel "-2.25/0.11"
    added 0
  ]
  edge [
    source 2
    target 0
    weight 0.9425707988502807
    color "gray"
    edgetype "local_response"
    penwidth 9.425707988502808
    deviation 0.0
    sign "positive"
    curved 1
    added 0
  ]
  edge [
    source 3
    target 1
    weight 0.7490666276777311
    color "#1c86ee"
    edgetype "local_response"
    penwidth 7.490666276777311
    deviation 1.0
    sign "positive"
    curved 1
    edgelabel "0.75/2.24"
    added 1
  ]
  edge [
    source 3
    target 8
    weight 0.6580289730626113
    color "gray"
    edgetype "local_response"
    penwidth 6.580289730626113
    deviation 0.0
    sign "positive"
    curved 0
    added 1
  ]
  edge [
    source 4
    target 1
    weight -1.281391231231771
    color "gray"
    edgetype "local_response"
    penwidth 10.0
    deviation 0.0
    sign "negative"
    curved 1
    added 0
  ]
  edge [
    source 4
    target 3
    weight 0.8523444880616995
    color "#1c86ee"
    edgetype "local_response"
    penwidth 8.523444880616996
    deviation 1.0
    sign "positive"
    curved 0
    edgelabel "0.85/0.62"
    added 0
  ]
  edge [
    source 5
    target 6
    weight 0.1919177215458927
    color "#1c86ee"
    edgetype "local_response"
    penwidth 1.919177215458927
    deviation 1.0
    sign "positive"
    curved 0
    edgelabel "0.19/0.33"
    added 1
  ]
  edge [
    source 5
    target 0
    weight -0.08458228550695746
    color "gray"
    edgetype "local_response"
    penwidth 0.8458228550695746
    deviation 0.0
    sign "negative"
    curved 0
    added 1
  ]
  edge [
    source 5
    target 2
    weight 0.2833352794428105
    color "#1c86ee"
    edgetype "local_response"
    penwidth 2.833352794428105
    deviation 1.0
    sign "positive"
    curved 0
    edgelabel "0.28/0.49"
    added 1
  ]
  edge [
    source 5
    target 4
    weight 0.03192646515017239
    color "gray"
    edgetype "local_response"
    penwidth 0.3192646515017239
    deviation 0.0
    sign "positive"
    curved 0
    added 1
  ]
  edge [
    source 7
    target 5
    weight 1.3506280339481749
    color "#1c86ee"
    edgetype "local_response"
    penwidth 10.0
    deviation 1.0
    sign "positive"
    curved 0
    edgelabel "1.35/1.12"
    added 1
  ]
  edge [
    source 8
    target 4
    weight 0.7100120656129136
    color "gray"
    edgetype "local_response"
    penwidth 7.100120656129136
    deviation 0.0
    sign "positive"
    curved 0
    added 1
  ]
  edge [
    source 9
    target 1
    weight -6.627811417293375
    color "#1c86ee"
    edgetype "perturbation"
    penwidth 10.0
    deviation 1.0
    sign "negative"
    curved 0
    added 0
  ]
  edge [
    source 10
    target 5
    weight -1.9394847723895141
    color "#1c86ee"
    edgetype "perturbation"
    penwidth 10.0
    deviation 1.0
    sign "negative"
    curved 0
    added 0
  ]
  edge [
    source 11
    target 1
    weight -2.7636686009360867
    color "#1c86ee"
    edgetype "perturbation"
    penwidth 10.0
    deviation 1.0
    sign "negative"
    curved 0
    added 0
  ]
  edge [
    source 12
    target 1
    weight -6.364302905579905
    color "#1c86ee"
    edgetype "perturbation"
    penwidth 10.0
    deviation 1.0
    sign "negative"
    curved 0
    added 0
  ]
  edge [
    source 13
    target 8
    weight -0.44116764584853563
    color "#1c86ee"
    edgetype "perturbation"
    penwidth 4.411676458485356
    deviation 1.0
    sign "negative"
    curved 0
    added 0
  ]
  edge [
    source 13
    target 1
    weight -7.189650300172911
    color "#1c86ee"
    edgetype "perturbation"
    penwidth 10.0
    deviation 1.0
    sign "negative"
    curved 0
    added 0
  ]
]
