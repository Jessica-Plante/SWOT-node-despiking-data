# WSE Filtering and Processing Script (R)

This R script filters and cleans SWOT-derived Water Surface Elevation (WSE) data for a specific section of the Chilcotin River. The processing includes spatial filtering, de-spiking using a rolling median, and exporting cleaned CSV files for further analysis.

---

## Overview

The script performs the following operations:

1. **Loads CSV files** for different acquisition dates.
2. **Filters spatially** for a specified reach of the Chilcotin River.
3. **Applies a 5-point rolling median filter** to remove outlier spikes in the WSE signal.
4. **Exports cleaned data** to new CSV files for each date.

---

## Processing Steps

### 1. Spatial Filtering

Only data points within this bounding box are retained:

- Latitude: `51.7` to `52.0`
- Longitude: `-122.8256` to `-122.7269`
- River name: `"Chilcotin River"`

### 2. De-spiking (Noise Filtering)

To remove noise and spurious spikes in WSE data, a rolling median filter with a window size of 5 is applied. Any resulting `NA` values are removed.
