[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![GitHub](https://img.shields.io/badge/GitHub-SDM--TIB%2FInterpretME-blue?logo=GitHub)](https://github.com/SDM-TIB/InterpretME)
[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/SDM-TIB/InterpretME_Demo_ESWC2023/HEAD?labpath=InterpretME_Demo.ipynb)

# InterpretME Demo

![InterpretME Design Pattern](https://raw.githubusercontent.com/SDM-TIB/InterpretME_Demo/main/images/DesignPattern.png "InterpretME Design Pattern")

InterpretME [1], is an analytical tool tailored for both KGs and datasets (`.csv` or `.json`) for fine-grained representations, in a KG, of the main characteristics of trained machine learning models. InterpretME recieves JSON input, i.e., `features' definition`, `classes` and the `SHACL` constraints from the user. 
The features' definition is classified into independent and dependent variables later used in the predictive models. 
The feature definition has the following format "x":"?x a <http://dbpedia.org/ontology/Person>.\n", "gender":"Optional{?x <http://dbpedia.org/ontology/gender> ?gender.}" where the first part states the attribute from the KG and the later part describes the definition of that attribute in the KG using SPARQL. 
This definition allows InterpretME to trace back the origin of that feature in the KG. A *SELECT* SPARQL query is utilized to retrieve the data from the application domain. InterpretME is presented into three layers:*Train*, *Deduce* and *Explain* layer. 
In the *Train* layer, to perform the predictive task- SHACL validation [2], data curation, AutoML [3], and predictive model are utilized and interpretable tools such as Decision trees and LIME [4] are implemented to understand the predictions. 
InterpretME generates an InterpretME KG with the traced metadata of the trained predictive model in the *Explain* layer to provide users with more enhanced and reliable interpretations. 
An efficient RML interpreter (SDM-RDFizer [5]) and Federated Query Processing (DeTrusty [6]) are used in the creation and utilization of the InterpretME KG. Executing federated query on top of the InterpretME KG and original KG, in turn, helps user to perform data exploration and trace the entity predicted with all the relevant features in the original KG. 
Additionally, different metrics like precision, recall and accuracy along with LIME interpretations are provided to the user. 
The exemplar queries template are available in the folder `queries/french_royalty`.


## Demonstration
This repository contains the jupyter notebook (`Interpretme_Demo.ipynb`) for a simple demonstration of InterpretME; how to interpret the machine learning models over KGs.
For demonstration, InterpretME is utilized over the **French Royalty KG**. The SPARQL query returns the information about french royal family with relationships, i.e., *dbo:child*, *dbo:spouse* etc. Here, the predictive task is to predict whether a french royal has a spouse.
In terms of the traits of the predictive models and SHACL validation, InterpretME KG depicts the target entities with a detailed contextual edges.
A demonstration video is also available [`online`](https://www.youtube.com/watch?v=-DPec1sLsHs).
## Getting Started
Clone the repository
```python
git clone git@github.com:SDM-TIB/InterpretME_Demo_ESWC2023.git
```

To run the demo, execute the following in your terminal:
```python
docker-compose up -d
```

You can then access the demo notebook in your browser at [`localhost:8888/lab/tree/InterpretME_Demo.ipynb`](http://localhost:8888/lab/tree/InterpretME_Demo.ipynb).

Alternatively, you can click on the Binder badge above and execute the Jupyter notebook there. Note that Binder might assign low computational resources to the instance. Hence, execution time can be higher compared to executing the notebook locally.

## License
This work is licensed under the MIT license.

## Authors
InterpretME has been developed by members of the Scientific Data Management Group at TIB, as an ongoing research effort.
The development is co-ordinated and supervised by Maria-Esther Vidal.
We strongly encourage you to report any issues you have with InterpretME.
Please, use the GitHub issue tracker to do so.
InterpretME has been implemented in joint work by Yashrajsinh Chudasama, Disha Purohit, and Philipp D. Rohde.

## References
[1] Y. Chudasama, D. Purohit, P.D. Rohde, J. Gercke, M.E. Vidal. InterpretME v1.3.2, July 2023. DOI: [10.5281/zenodo.8112628](https://doi.org/10.5281/zenodo.8112628)

[2] M. Figuera, P.D. Rohde, M.-E. Vidal. Trav-SHACL: Efficiently Validating Networks of SHACL Constraints. In: *WWW '21: Proceedings of the Web Conference 2021*, ACM, New York, NY, USA, 2021. DOI: [10.1145/3442381.3449877](https://doi.org/10.1145/3442381.3449877).

[3] Akiba, Takuya and Sano, Shotaro and Yanase, Toshihiko and Ohta, Takeru and Koyama, Masanori. Optuna: A Next-generation Hyperparameter Optimization Framework. In: *KDD '19: Proceedings of the 25th ACM SIGKDD International Conference on Knowledge Discovery and Data Mining*, ACM, New York, NY, USA, 2019. DOI: [10.1145/3292500.3330701](https://doi.org/10.1145/3292500.3330701)

[4] Marco Ribeiro, Sameer Singh, and Carlos Guestrin. "Why Should I Trust You?": Explaining the Predictions of Any Classifier. In: *KDD '16: Proceedings of the 22nd ACM SIGKDD International Conference on Knowledge Discovery and Data Mining*, ACM, New York, NY, USA, 2016. DOI: [10.1145/2939672.2939778](https://doi.org/10.1145/2939672.2939778)

[5] E. Iglesias, S. Jozashoori, D. Chaves-Fraga, D. Collarana, M.-E. Vidal. SDM-RDFizer: An RML Interpreter for the Efficient Creation of RDF Knowledge Graphs. In: *CIKM '20: Proceedings of the 29th ACM International Conference on Information & Knowledge Management*, ACM, New York, NY, USA, 2020. DOI: [10.1145/3340531.3412881](https://doi.org/10.1145/3340531.3412881).

[6] P.D. Rohde, M. Bechara and Avellino. DeTrusty v0.12.3, June 2023. DOI: [10.5281/zenodo.8095810](https://doi.org/10.5281/zenodo.8095810).
