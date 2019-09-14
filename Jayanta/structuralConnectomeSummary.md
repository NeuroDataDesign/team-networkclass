# Mapping population-based structural connectomes ([link](https://arxiv.org/abs/1906.03661))
----
* This paper proposes a framework for generating multi-level groupwise connectomes based on binary thresholded, count, cluster number, average fiber length, max FA, connected surface area

* The framework consists of 
    * reliable construction of connectome for the whole brain
    * low-dimensional representation of streamlines in each connection
    * multi-level connectome analysis

* Steps for doing tractography with less estimation error:
    * cortical surface dilation
    * streamline cutting
    * removing outlier streamlines that do not follow the path that the bundle follows
    * streamline variation decomposition
    * encoding and decoding of streamlines

* the main concren for me while reading the paper was finding if there is any benchmark or standard to which we can compare our heritability results and one is mentioned in the paper ([link](https://www.sciencedirect.com/science/article/abs/pii/S1053811915001512))