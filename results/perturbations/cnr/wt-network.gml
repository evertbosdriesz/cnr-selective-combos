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
    color "green"
    edgetype "local_response"
    penwidth 6.0977759134584
    deviation 1.0
    sign "positive"
    curved 0
    edgelabel "4.07"
    added 1
  ]
  edge [
    source 0
    target 7
    weight 1.0178735063356743
    color "gray"
    edgetype "local_response"
    penwidth 1.5268102595035113
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
    penwidth 0.0843321852120502
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
    penwidth 0.1765259033481581
    deviation 0.0
    sign "positive"
    curved 0
    added 1
  ]
  edge [
    source 2
    target 1
    weight -2.253576462392827
    color "red"
    edgetype "local_response"
    penwidth 3.3803646935892404
    deviation 1.0
    sign "negative"
    curved 1
    edgelabel "-2.25"
    added 0
  ]
  edge [
    source 2
    target 0
    weight 0.9425707988502813
    color "gray"
    edgetype "local_response"
    penwidth 1.4138561982754219
    deviation 0.0
    sign "positive"
    curved 0
    added 0
  ]
  edge [
    source 3
    target 1
    weight 0.7490666276777311
    color "green"
    edgetype "local_response"
    penwidth 1.1235999415165967
    deviation 1.0
    sign "positive"
    curved 1
    edgelabel "0.75"
    added 1
  ]
  edge [
    source 3
    target 8
    weight 0.6580289730626113
    color "gray"
    edgetype "local_response"
    penwidth 0.987043459593917
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
    penwidth 1.9220868468476566
    deviation 0.0
    sign "negative"
    curved 1
    added 0
  ]
  edge [
    source 4
    target 3
    weight 0.8523444880616995
    color "green"
    edgetype "local_response"
    penwidth 1.2785167320925492
    deviation 1.0
    sign "positive"
    curved 0
    edgelabel "0.85"
    added 0
  ]
  edge [
    source 5
    target 6
    weight 0.1919177215458927
    color "green"
    edgetype "local_response"
    penwidth 0.28787658231883906
    deviation 1.0
    sign "positive"
    curved 0
    edgelabel "0.19"
    added 1
  ]
  edge [
    source 5
    target 0
    weight -0.08458228550695769
    color "gray"
    edgetype "local_response"
    penwidth 0.12687342826043654
    deviation 0.0
    sign "negative"
    curved 1
    added 1
  ]
  edge [
    source 5
    target 2
    weight 0.2833352794428105
    color "green"
    edgetype "local_response"
    penwidth 0.42500291916421573
    deviation 1.0
    sign "positive"
    curved 0
    edgelabel "0.28"
    added 1
  ]
  edge [
    source 5
    target 4
    weight 0.03192646515017239
    color "gray"
    edgetype "local_response"
    penwidth 0.047889697725258584
    deviation 0.0
    sign "positive"
    curved 0
    added 1
  ]
  edge [
    source 7
    target 5
    weight 1.3506280339481749
    color "green"
    edgetype "local_response"
    penwidth 2.0259420509222625
    deviation 1.0
    sign "positive"
    curved 0
    edgelabel "1.35"
    added 1
  ]
  edge [
    source 8
    target 4
    weight 0.7100120656129136
    color "gray"
    edgetype "local_response"
    penwidth 1.0650180984193705
    deviation 0.0
    sign "positive"
    curved 0
    added 1
  ]
  edge [
    source 9
    target 1
    weight -6.627811417293375
    color "red"
    edgetype "perturbation"
    penwidth 9.941717125940063
    deviation 1.0
    sign "negative"
    curved 0
    added 0
  ]
  edge [
    source 10
    target 5
    weight -1.9394847723895141
    color "red"
    edgetype "perturbation"
    penwidth 2.909227158584271
    deviation 1.0
    sign "negative"
    curved 0
    added 0
  ]
  edge [
    source 11
    target 1
    weight -2.7636686009360867
    color "red"
    edgetype "perturbation"
    penwidth 4.1455029014041305
    deviation 1.0
    sign "negative"
    curved 0
    added 0
  ]
  edge [
    source 12
    target 1
    weight -6.364302905579905
    color "red"
    edgetype "perturbation"
    penwidth 9.546454358369857
    deviation 1.0
    sign "negative"
    curved 0
    added 0
  ]
  edge [
    source 13
    target 8
    weight -0.44116764584853563
    color "red"
    edgetype "perturbation"
    penwidth 0.6617514687728034
    deviation 1.0
    sign "negative"
    curved 0
    added 0
  ]
  edge [
    source 13
    target 1
    weight -7.189650300172911
    color "red"
    edgetype "perturbation"
    penwidth 10.0
    deviation 1.0
    sign "negative"
    curved 0
    added 0
  ]
]
