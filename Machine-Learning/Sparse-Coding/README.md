# Sparse Coding

Implementación de sparse coding sobre espectrogramas y datasets de imágenes usando `MiniBatchDictionaryLearning` y `SparseCoder` de scikit-learn.

---

## Notebooks

### 1. `sparse_coding_digits.ipynb` — Digits Dataset (sklearn)
Sparse coding sobre el dataset Digits de scikit-learn (1 797 imágenes 8×8 de dígitos escritos a mano).
Diccionario sobrecompleto de **256 átomos** para un espacio de **64 dimensiones** (ratio 4×).

**Contenido:**
- Aprendizaje del diccionario con `MiniBatchDictionaryLearning`
- Codificación dispersa con `SparseCoder`
- Visualización del diccionario y análisis de átomos más usados
- Reconstrucción por clase y tradeoff sparsity vs error

### 2. `sparse_coding_fscc.ipynb` — Free Spoken Digit Dataset
Sparse coding sobre espectrogramas STFT de dígitos hablados.
Diccionario sobrecompleto de **512 átomos** sobre **257 bins de frecuencia**.

**Contenido:**
- Extracción de espectrogramas STFT con log-compresión
- Aprendizaje de átomos espectrales con `MiniBatchDictionaryLearning`
- Reconstrucción de audio via Griffin-Lim
- Análisis de átomos más usados y tradeoff sparsity vs error

---

## Dataset

El notebook `sparse_coding_fscc.ipynb` requiere el Free Spoken Digit Dataset:
```bash
git clone https://github.com/Jakobovski/free-spoken-digit-dataset Machine-Learning/Sparse-Coding/datasets/free-spoken-digit-dataset
```

El notebook `sparse_coding_digits.ipynb` no requiere descarga — usa `sklearn.datasets.load_digits`.

---

## Requisitos
```bash
pip install numpy scikit-learn librosa matplotlib pandas
```