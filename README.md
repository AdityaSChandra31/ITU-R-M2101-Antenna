# ITU-R M.2101 Active Antenna System (AAS) MATLAB Implementation

A MATLAB implementation of the **ITU-R M.2101 Active Antenna System (AAS)** antenna model for **5G NR/mmWave** systems. This project simulates configurable **Uniform Planar Arrays (UPAs)** with beam steering, element radiation patterns, array factors, composite antenna gain, 2D radiation cuts, polar plots, and 3D radiation pattern visualization.

---

## Features

- 📡 Configurable M × N Uniform Planar Array
- 🎯 Electronic beam steering (Elevation & Azimuth)
- 📈 ITU-R M.2101 element radiation pattern
- 📊 Beamforming weight generation
- 📐 Array factor computation
- 📶 Composite antenna gain calculation
- 📉 Vertical radiation pattern
- 📉 Horizontal radiation pattern
- 🌀 Polar radiation plots
- 🌍 3D radiation pattern visualization
- 📏 Automatic peak gain calculation
- ⚙️ Fully parameterized MATLAB implementation

---

## Repository Structure

```
ITU-R-M2101-Antenna/
│
├── main.m                  % Driver script
├── elementPattern.m        % ITU-R M.2101 element radiation pattern
├── beamWeights.m           % Beamforming weight generation
├── arrayFactor.m           % Uniform planar array factor
├── compositeGain.m         % Composite antenna gain
├── verticalCut.m           % Vertical radiation pattern
├── horizontalCut.m         % Horizontal radiation pattern
├── pattern3D.m             % 3D radiation pattern
└── README.md
```

---

## Antenna Model

The implementation follows the antenna model described in **ITU-R M.2101**, consisting of

- Element Radiation Pattern
- Beamforming Weights
- Uniform Planar Array Factor
- Composite Antenna Gain

The peak antenna gain is computed automatically as

\[
G_{\max}=G_E+10\log_{10}(MN)
\]

where

- \(G_E\) = Element gain (dBi)
- \(M\) = Number of vertical elements
- \(N\) = Number of horizontal elements

---

## Default Parameters

| Parameter | Value |
|-----------|------:|
| Vertical Elements | 16 |
| Horizontal Elements | 16 |
| Element Spacing | 0.5 λ |
| Element Gain | 5 dBi |
| Vertical HPBW | 65° |
| Horizontal HPBW | 65° |
| Vertical Side-lobe Attenuation | 30 dB |
| Front-to-Back Attenuation | 30 dB |
| Maximum Antenna Gain | Automatically computed |

---

## Beam Steering

The beam can be steered in both elevation and azimuth.

```matlab
params.thetaScan = 0;
params.phiScan = 0;
```

Example

```matlab
params.thetaScan = 15;
params.phiScan = -20;
```

---

## Running the Simulation

Open MATLAB and execute

```matlab
main
```

The script automatically generates

- Vertical radiation pattern
- Horizontal radiation pattern
- Polar radiation plots
- 3D antenna radiation pattern

---

## Example Outputs

The simulation produces

- Cartesian radiation patterns
- Polar radiation patterns
- 3D radiation pattern
- Peak antenna gain
- 3 dB beamwidth

---

## Mathematical Model

### Element Pattern

Vertical attenuation

\[
A_{E,V}(\theta)
=
-\min
\left[
12\left(\frac{\theta}{\theta_{3dB}}\right)^2,
SLA_V
\right]
\]

Horizontal attenuation

\[
A_{E,H}(\phi)
=
-\min
\left[
12\left(\frac{\phi}{\phi_{3dB}}\right)^2,
A_m
\right]
\]

Element gain

\[
G_E(\theta,\phi)
=
G_{E,\max}
-
A_E(\theta,\phi)
\]

---

### Beamforming

Complex beamforming weights

\[
w_{m,n}
=
e^{-j2\pi(md_vu_0+nd_hv_0)}
\]

---

### Array Factor

\[
AF
=
\sum_{m=0}^{M-1}
\sum_{n=0}^{N-1}
w_{m,n}
e^{j2\pi(md_vu+nd_hv)}
\]

---

### Composite Gain

\[
G
=
G_E
+
20\log_{10}(AF)
\]

---

## Applications

This implementation can be used for

- 5G NR antenna modeling
- mmWave communication research
- Beamforming algorithm validation
- Antenna radiation pattern visualization
- Wireless system simulations
- Academic coursework
- Research and coexistence studies

---

## Requirements

- MATLAB R2020a or later
- No additional toolboxes required

---

## Future Improvements

- Multiple beam support
- Hybrid beamforming
- Amplitude tapering
- Beam scanning animations
- Side-lobe suppression algorithms
- Grating lobe visualization
- 3GPP TR 38.901 antenna models
- Export radiation patterns to CSV

---

## References

1. ITU-R Recommendation M.2101 – *Modelling and simulation of IMT networks and systems for use in sharing and compatibility studies.*

2. 3GPP TS 38.104 – *NR Base Station Radio Transmission and Reception.*

3. 3GPP TS 38.141-2 – *NR Base Station Conformance Testing.*

---

## Author

**Aditya S. Chandra**

M.Tech, Telecommunication Technology & Management  
Indian Institute of Technology Delhi

GitHub: https://github.com/AdityaSChandra31

---

## License

This project is released under the MIT License.

Feel free to use, modify, and cite this repository for academic and research purposes.

---

## Contributing

Contributions are welcome.

If you would like to improve the implementation, fix bugs, or add new features, please open an issue or submit a pull request.

---

## ⭐ Support

If you find this repository useful, consider giving it a **⭐ Star** on GitHub. It helps others discover the project and supports future development.
