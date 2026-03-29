#!/bin/bash

#for macOS (M chips)

ENVNAME=atomicaenv
conda create -n $ENVNAME python=3.11 -y #python version 3.11 is more compatable in macOS than original 3.9 
conda activate $ENVNAME
conda install numpy==1.26.4 -y
pip3 install torch==2.1.1 #cu118 is a specific version of the wheel used for navidia gpus which does not exist on macos

#check torch is downloaded
python3 - <<'EOF'
import torch
print(torch.__version__)
print("cuda:", torch.cuda.is_available())
print("mps:", torch.backends.mps.is_available())
EOF
#mps - metal performance shaders - allow M chip on apple ecosystem to use GPU-driven tasts

pip3 install torch-scatter torch-cluster -f https://data.pyg.org/whl/torch-2.1.1+cpu.html
pip3 install tensorboard==2.18.0
pip3 install e3nn==0.5.1 # possibly not compatible with e3nn > 0.5.4

#installing the rest in one line instead of the original multiple lines
pip3 install scipy==1.13.1 rdkit-pypi==2022.9.5 openbabel-wheel==3.1.1.20 biopython==1.84 biotite==0.40.0 atom3d wandb==0.18.2 orjson


# plotting
pip3 install umap-learn matplotlib seaborn plotly



#update some packages (used in tqdm)
pip3 install ipywidgets 
conda install -n base -c conda-forge jupyterlab_widgets

#to play with umap.plot
pip3 install bokeh datashader holoviews scikit-image colorcet