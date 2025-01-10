# HapFilterR

HapFilterR is an R package for analyzing Hapmap data. It provides tools for calculating Minor Allele Frequency (MAF), analyzing missing data, filtering SNPs, and summarizing Hapmap datasets.

## Installation

To install HapFilterR, use the following commands:

```r
# Install devtools if not already installed
install.packages("devtools")

# Install HapFilterR from GitHub
devtools::install_github("Khaled-H-Mousa/HapFilterR")
```

## Features

1. **Calculate Minor Allele Frequency (MAF):**
   - Computes the frequency of the less common allele for each SNP to identify genetic variants of interest.

2. **Analyze Missing Data:**
   - Calculates the percentage of missing genotypes for each SNP to assess data quality.

3. **Filter SNPs:**
   - Filters SNPs based on MAF and missing data thresholds, ensuring high-quality data for downstream analysis.

## Key Functions

### `calculate_minor_allele_frequency`
- **Description**: Calculates the Minor Allele Frequency (MAF) for each SNP.
- **Input**: Hapmap data frame.
- **Output**: Data frame with an additional `MAF` column.

- **Mathematical Formula**:

The Minor Allele Frequency (MAF) is defined as:

MAF = min(n_A / (n_A + n_B), n_B / (n_A + n_B))

Where:
- n_A: Count of allele A across all individuals.
- n_B: Count of allele B across all individuals.
- The minor allele is the allele with the smaller frequency in the population.


### `analyze_missing_data`
- **Description**: Analyzes the percentage of missing data for each SNP.
- **Input**: Hapmap data frame.
- **Output**: Data frame with an additional `MissingData` column.

- **Mathematical Formula**:
  The percentage of missing data for each SNP is calculated as:
  $$
  \text{Missing Percentage} = \left( \frac{\text{Number of Missing Genotypes}}{\text{Total Number of Genotypes}} \right) \times 100
  $$

### `filter_snps`
- **Description**: Filters SNPs based on MAF and missing data thresholds.
- **Input**:
  - Hapmap data frame.
  - MAF threshold (default = 0.05).
  - Missing data threshold (default = 10%).
- **Output**: Filtered data frame.

## Usage

### Example Workflow

```r
# Load the HapFilterR package
library(HapFilterR)

# Step 1: Load Hapmap data
hapmap_data <- HapFilterR::read_hapmap(file_path = "Data/Barley_50K_KNNimp.hmp.tsv")

# Step 2: Calculate Minor Allele Frequency (MAF)
hapmap_data <- calculate_minor_allele_frequency(hapmap_data)

# Step 3: Analyze Missing Data
hapmap_data <- analyze_missing_data(hapmap_data)

# Step 4: Filter SNPs based on thresholds
filtered_data <- filter_snps(hapmap_data, maf_threshold = 0.05, missing_threshold = 10)

# Step 5: Summarize the dataset
summary_stats <- summarize_hapmap(filtered_data)

# Step 6: Save the filtered dataset
write.csv(filtered_data, file = "OUT/New_filtered_data.csv", row.names = FALSE)
```

### Notes:
- The `read_hapmap` function is used to load data in Hapmap format. Ensure your input file is formatted correctly.
- Adjust `maf_threshold` and `missing_threshold` based on your research needs.
