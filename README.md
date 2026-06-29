# ITU-R M.2101 Active Antenna System (AAS) MATLAB Implementation

A MATLAB implementation of the **ITU-R M.2101 Active Antenna System (AAS)** antenna model for **5G NR/mmWave** systems. This project simulates configurable **Uniform Planar Arrays (UPAs)** with electronic beam steering, element radiation patterns, array factors, composite antenna gain, 2D radiation cuts, polar plots, and 3D radiation pattern visualization.

---

## Features

- 📡 Configurable **M × N Uniform Planar Array (UPA)**
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

```text
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
├── LICENSE
└── README.md
```

---

## Antenna Model

The implementation follows the **ITU-R M.2101** antenna model consisting of:

- Element Radiation Pattern
- Beamforming Weights
- Uniform Planar Array Factor
- Composite Antenna Gain

The maximum antenna gain is automatically computed as

```math
G_{\max}=G_E+10\log_{10}(MN)
```

where

- $G_E$ = Element gain (dBi)
- $M$ = Number of vertical antenna elements
- $N$ = Number of horizontal antenna elements

---

## Default Parameters

| Parameter | Default Value |
|-----------|--------------:|
| Vertical Elements (M) | 16 |
| Horizontal Elements (N) | 16 |
| Element Spacing | 0.5 λ |
| Element Gain | 5 dBi |
| Vertical HPBW | 65° |
| Horizontal HPBW | 65° |
| Vertical Side-lobe Attenuation | 30 dB |
| Front-to-Back Attenuation | 30 dB |
| Maximum Gain | Automatically Computed |

---

## Beam Steering

The beam can be steered in both elevation and azimuth.

```matlab
params.thetaScan = 0;
params.phiScan   = 0;
```

Example:

```matlab
params.thetaScan = 15;
params.phiScan   = -20;
```

---

## Running the Simulation

Open MATLAB and execute

```matlab
main
```

The program automatically generates:

- Vertical radiation pattern
- Horizontal radiation pattern
- Polar radiation plots
- 3D antenna radiation pattern

---

## Example Outputs

The simulation produces:

- 📈 Vertical radiation pattern
- 📈 Horizontal radiation pattern
- 🌀 Polar radiation plots
- 🌍 3D radiation pattern
- 📏 Peak antenna gain
- 📐 3 dB beamwidth

> **Note:** Add screenshots of the generated plots here after running the simulation.

---

# Mathematical Model

## Element Radiation Pattern

### Vertical Element Attenuation

```math
A_{E,V}(\theta)
=
-\min\left[
12\left(\frac{\theta}{\theta_{3\mathrm{dB}}}\right)^2,
SLA_V
\right]
```

### Horizontal Element Attenuation

```math
A_{E,H}(\phi)
=
-\min\left[
12\left(\frac{\phi}{\phi_{3\mathrm{dB}}}\right)^2,
A_m
\right]
```

### Combined Element Pattern

```math
A_E(\theta,\phi)
=
\min
\left(
-\left(A_{E,V}+A_{E,H}\right),
A_m
\right)
```

### Element Gain

```math
G_E(\theta,\phi)
=
G_{E,\max}
-
A_E(\theta,\phi)
```

---

## Beamforming Weights

The complex beamforming weights are

```math
w_{m,n}
=
e^{-j2\pi\left(md_vu_0+nd_hv_0\right)}
```

where

```math
u_0=\sin(\theta_0)\cos(\phi_0)
```

```math
v_0=\sin(\theta_0)\sin(\phi_0)
```

---

## Array Factor

The normalized array factor is

```math
AF(\theta,\phi)
=
\frac{1}{\sqrt{MN}}
\left|
\sum_{m=0}^{M-1}
\sum_{n=0}^{N-1}
w_{m,n}
e^{j2\pi(md_vu+nd_hv)}
\right|
```

where

```math
u=\sin(\theta)\cos(\phi)
```

```math
v=\sin(\theta)\sin(\phi)
```

---

## Composite Antenna Gain

The composite antenna gain is computed as

```math
G(\theta,\phi)
=
G_E(\theta,\phi)
+
20\log_{10}\left(AF(\theta,\phi)\right)
```

The overall gain is limited by

```math
G(\theta,\phi)\le G_{\max}
```

---

## Automatic Peak Gain Calculation

The peak gain for an **M × N** planar array is

```math
G_{\max}
=
G_{\mathrm{element}}
+
10\log_{10}(MN)
```

Example values:

| Array Size | Peak Gain |
|------------|----------:|
| 4 × 4 | 17.04 dBi |
| 8 × 8 | 23.06 dBi |
| 16 × 16 | 29.08 dBi |
| 32 × 32 | 35.10 dBi |

---

## Applications

This project can be used for:

- 5G NR antenna modeling
- mmWave communication research
- Active Antenna System (AAS) simulation
- Beamforming algorithm validation
- Antenna radiation pattern visualization
- Wireless communication simulations
- Academic coursework
- Research and coexistence studies

---

## Requirements

- MATLAB R2020a or later
- No additional MATLAB toolboxes required

---

## Future Improvements

- Multiple beam support
- Hybrid beamforming
- Amplitude tapering
- Side-lobe suppression
- Beam scanning animation
- Grating lobe visualization
- 3GPP TR 38.901 antenna model
- Pattern export to CSV
- Interactive GUI

---

## References

1. **ITU-R Recommendation M.2101**  
   *Modelling and simulation of IMT networks and systems for use in sharing and compatibility studies.*

2. **3GPP TS 38.104**  
   *NR Base Station (BS) Radio Transmission and Reception.*

3. **3GPP TS 38.141-2**  
   *NR Base Station Conformance Testing.*

---

## Author

**Aditya S. Chandra**

M.Tech, Telecommunication Technology & Management  
**Indian Institute of Technology Delhi**

GitHub: https://github.com/AdityaSChandra31

---

## License

This project is licensed under the **MIT License**.

You are free to use, modify, and distribute this software for academic and research purposes.

---

## Contributing

Contributions are welcome!

If you find a bug, have an improvement, or would like to add a new feature, feel free to:

- Open an Issue
- Submit a Pull Request
- Suggest enhancements

---

## Star this Repository ⭐

If you found this project useful, please consider giving it a **⭐ Star** on GitHub. It helps others discover the repository and supports future development.

---

**Keywords:** MATLAB, ITU-R M.2101, Active Antenna System, AAS, Beamforming, Uniform Planar Array, UPA, 5G NR, mmWave, Phased Array, Antenna Pattern, Radiation Pattern.
