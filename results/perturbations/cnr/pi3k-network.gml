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
    weight 0.502891678904116
    color "green"
    edgetype "local_response"
    penwidth 0.754337518356174
    deviation 1.0
    sign "positive"
    curved 0
    edgelabel "0.5"
    added 1
  ]
  edge [
    source 0
    target 7
    weight 1.017873506335674
    color "gray"
    edgetype "local_response"
    penwidth 1.5268102595035111
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
    weight 0.11496039245018146
    color "green"
    edgetype "local_response"
    penwidth 0.17244058867527218
    deviation 1.0
    sign "positive"
    curved 1
    edgelabel "0.11"
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
    weight 2.2421749232459414
    color "green"
    edgetype "local_response"
    penwidth 3.363262384868912
    deviation 1.0
    sign "positive"
    curved 1
    edgelabel "2.24"
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
    weight 0.616463356154612
    color "green"
    edgetype "local_response"
    penwidth 0.924695034231918
    deviation 1.0
    sign "positive"
    curved 0
    edgelabel "0.62"
    added 0
  ]
  edge [
    source 5
    target 6
    weight 0.3269922324611523
    color "green"
    edgetype "local_response"
    penwidth 0.4904883486917284
    deviation 1.0
    sign "positive"
    curved 0
    edgelabel "0.33"
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
    weight 0.48928692288052467
    color "green"
    edgetype "local_response"
    penwidth 0.7339303843207869
    deviation 1.0
    sign "positive"
    curved 0
    edgelabel "0.49"
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
    weight 1.1182258947520962
    color "green"
    edgetype "local_response"
    penwidth 1.6773388421281443
    deviation 1.0
    sign "positive"
    curved 0
    edgelabel "1.12"
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
    weight -7.85862373577403
    color "red"
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
    weight -1.3302097863761275
    color "red"
    edgetype "perturbation"
    penwidth 1.9953146795641912
    deviation 1.0
    sign "negative"
    curved 0
    added 0
  ]
  edge [
    source 11
    target 1
    weight 0.0
    color "red"
    edgetype "perturbation"
    penwidth 0.0
    deviation 1.0
    sign "negative"
    curved 0
    added 0
  ]
  edge [
    source 12
    target 1
    weight -1.8439039414282725
    color "red"
    edgetype "perturbation"
    penwidth 2.765855912142409
    deviation 1.0
    sign "negative"
    curved 0
    added 0
  ]
  edge [
    source 13
    target 8
    weight -0.9841714613273725
    color "red"
    edgetype "perturbation"
    penwidth 1.4762571919910588
    deviation 1.0
    sign "negative"
    curved 0
    added 0
  ]
  edge [
    source 13
    target 1
    weight -4.190937152005511
    color "red"
    edgetype "perturbation"
    penwidth 6.286405728008267
    deviation 1.0
    sign "negative"
    curved 0
    added 0
  ]
]
