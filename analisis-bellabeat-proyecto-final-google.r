{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "07b49ccc",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-10-27T21:54:54.696033Z",
     "iopub.status.busy": "2024-10-27T21:54:54.693543Z",
     "iopub.status.idle": "2024-10-27T21:55:37.559535Z",
     "shell.execute_reply": "2024-10-27T21:55:37.557374Z"
    },
    "papermill": {
     "duration": 42.876572,
     "end_time": "2024-10-27T21:55:37.564081",
     "exception": false,
     "start_time": "2024-10-27T21:54:54.687509",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Installing package into ‘/usr/local/lib/R/site-library’\n",
      "(as ‘lib’ is unspecified)\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Installing package into ‘/usr/local/lib/R/site-library’\n",
      "(as ‘lib’ is unspecified)\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Installing package into ‘/usr/local/lib/R/site-library’\n",
      "(as ‘lib’ is unspecified)\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching core tidyverse packages\u001b[22m ──────────────────────── tidyverse 2.0.0 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mdplyr    \u001b[39m 1.1.4     \u001b[32m✔\u001b[39m \u001b[34mreadr    \u001b[39m 2.1.5\n",
      "\u001b[32m✔\u001b[39m \u001b[34mforcats  \u001b[39m 1.0.0     \u001b[32m✔\u001b[39m \u001b[34mstringr  \u001b[39m 1.5.1\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2  \u001b[39m 3.5.1     \u001b[32m✔\u001b[39m \u001b[34mtibble   \u001b[39m 3.2.1\n",
      "\u001b[32m✔\u001b[39m \u001b[34mlubridate\u001b[39m 1.9.3     \u001b[32m✔\u001b[39m \u001b[34mtidyr    \u001b[39m 1.3.1\n",
      "\u001b[32m✔\u001b[39m \u001b[34mpurrr    \u001b[39m 1.0.2     \n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\u001b[36mℹ\u001b[39m Use the conflicted package (\u001b[3m\u001b[34m<http://conflicted.r-lib.org/>\u001b[39m\u001b[23m) to force all conflicts to become errors\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "Attaching package: ‘janitor’\n",
      "\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "The following objects are masked from ‘package:stats’:\n",
      "\n",
      "    chisq.test, fisher.test\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "# Instalar y cargar las librerías necesarias\n",
    "install.packages(\"tidyverse\")  # Colección de paquetes para manipulación y visualización de datos\n",
    "install.packages(\"skimr\")      # Resumen rápido de datos\n",
    "install.packages(\"janitor\")    # Limpieza de datos (nombres de columnas)\n",
    "\n",
    "# Cargar las librerías\n",
    "library(tidyverse)  # metapackage de todas las librerías del tidyverse (dplyr, ggplot2, tidyr, etc.)\n",
    "library(skimr)      # Para obtener un resumen detallado de los datos\n",
    "library(janitor)    # Para limpiar nombres de columnas\n",
    "\n",
    "# Documentación:\n",
    "# - tidyverse: Nos proporciona una serie de herramientas para trabajar con datos (manipulación y visualización).\n",
    "# - skimr: Permite obtener un resumen detallado de las variables.\n",
    "# - janitor: Limpia los nombres de las columnas, haciéndolos más consistentes.\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "6c9546d4",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-10-27T21:55:37.617411Z",
     "iopub.status.busy": "2024-10-27T21:55:37.573749Z",
     "iopub.status.idle": "2024-10-27T21:55:37.651343Z",
     "shell.execute_reply": "2024-10-27T21:55:37.649229Z"
    },
    "papermill": {
     "duration": 0.085968,
     "end_time": "2024-10-27T21:55:37.654210",
     "exception": false,
     "start_time": "2024-10-27T21:55:37.568242",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'dailyActivity_merged.csv'</li><li>'heartrate_seconds_merged.csv'</li><li>'hourlyCalories_merged.csv'</li><li>'hourlyIntensities_merged.csv'</li><li>'hourlySteps_merged.csv'</li><li>'minuteCaloriesNarrow_merged.csv'</li><li>'minuteIntensitiesNarrow_merged.csv'</li><li>'minuteMETsNarrow_merged.csv'</li><li>'minuteSleep_merged.csv'</li><li>'minuteStepsNarrow_merged.csv'</li><li>'weightLogInfo_merged.csv'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'dailyActivity\\_merged.csv'\n",
       "\\item 'heartrate\\_seconds\\_merged.csv'\n",
       "\\item 'hourlyCalories\\_merged.csv'\n",
       "\\item 'hourlyIntensities\\_merged.csv'\n",
       "\\item 'hourlySteps\\_merged.csv'\n",
       "\\item 'minuteCaloriesNarrow\\_merged.csv'\n",
       "\\item 'minuteIntensitiesNarrow\\_merged.csv'\n",
       "\\item 'minuteMETsNarrow\\_merged.csv'\n",
       "\\item 'minuteSleep\\_merged.csv'\n",
       "\\item 'minuteStepsNarrow\\_merged.csv'\n",
       "\\item 'weightLogInfo\\_merged.csv'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'dailyActivity_merged.csv'\n",
       "2. 'heartrate_seconds_merged.csv'\n",
       "3. 'hourlyCalories_merged.csv'\n",
       "4. 'hourlyIntensities_merged.csv'\n",
       "5. 'hourlySteps_merged.csv'\n",
       "6. 'minuteCaloriesNarrow_merged.csv'\n",
       "7. 'minuteIntensitiesNarrow_merged.csv'\n",
       "8. 'minuteMETsNarrow_merged.csv'\n",
       "9. 'minuteSleep_merged.csv'\n",
       "10. 'minuteStepsNarrow_merged.csv'\n",
       "11. 'weightLogInfo_merged.csv'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"dailyActivity_merged.csv\"           \"heartrate_seconds_merged.csv\"      \n",
       " [3] \"hourlyCalories_merged.csv\"          \"hourlyIntensities_merged.csv\"      \n",
       " [5] \"hourlySteps_merged.csv\"             \"minuteCaloriesNarrow_merged.csv\"   \n",
       " [7] \"minuteIntensitiesNarrow_merged.csv\" \"minuteMETsNarrow_merged.csv\"       \n",
       " [9] \"minuteSleep_merged.csv\"             \"minuteStepsNarrow_merged.csv\"      \n",
       "[11] \"weightLogInfo_merged.csv\"          "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "\n",
    "# Almacenar la ruta base en una variable\n",
    "ruta_base <- \"../input/fitbit/mturkfitbit_export_3.12.16-4.11.16/Fitabase Data 3.12.16-4.11.16\"\n",
    "\n",
    "# Listar los archivos y subcarpetas dentro de la ruta base\n",
    "list.files(path = ruta_base, recursive = TRUE)\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "a2b4afdf",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-10-27T21:55:37.665415Z",
     "iopub.status.busy": "2024-10-27T21:55:37.663603Z",
     "iopub.status.idle": "2024-10-27T21:55:45.031320Z",
     "shell.execute_reply": "2024-10-27T21:55:45.029201Z"
    },
    "papermill": {
     "duration": 7.377271,
     "end_time": "2024-10-27T21:55:45.035085",
     "exception": false,
     "start_time": "2024-10-27T21:55:37.657814",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Cargar los archivos CSV utilizando la variable de ruta correctamente\n",
    "daily_activity <- read_csv(file.path(ruta_base, \"dailyActivity_merged.csv\"), show_col_types = FALSE)\n",
    "heartrate <- read_csv(file.path(ruta_base, \"heartrate_seconds_merged.csv\"), show_col_types = FALSE)\n",
    "hourly_calories <- read_csv(file.path(ruta_base, \"hourlyCalories_merged.csv\"), show_col_types = FALSE)\n",
    "hourly_intensities <- read_csv(file.path(ruta_base, \"hourlyIntensities_merged.csv\"), show_col_types = FALSE)\n",
    "hourly_steps <- read_csv(file.path(ruta_base, \"hourlySteps_merged.csv\"), show_col_types = FALSE)\n",
    "minute_calories <- read_csv(file.path(ruta_base, \"minuteCaloriesNarrow_merged.csv\"), show_col_types = FALSE)\n",
    "minute_intensities <- read_csv(file.path(ruta_base, \"minuteIntensitiesNarrow_merged.csv\"), show_col_types = FALSE)\n",
    "minute_mets <- read_csv(file.path(ruta_base, \"minuteMETsNarrow_merged.csv\"), show_col_types = FALSE)\n",
    "minute_sleep <- read_csv(file.path(ruta_base, \"minuteSleep_merged.csv\"), show_col_types = FALSE)\n",
    "minute_steps <- read_csv(file.path(ruta_base, \"minuteStepsNarrow_merged.csv\"), show_col_types = FALSE)\n",
    "weight_log <- read_csv(file.path(ruta_base, \"weightLogInfo_merged.csv\"), show_col_types = FALSE)\n",
    "\n",
    "# Documentación:\n",
    "# - Cada archivo CSV se carga en una variable separada, con un nombre descriptivo que corresponde a su contenido.\n",
    "# - Utilizamos la función `read_csv` para importar cada archivo correctamente construyendo la ruta."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "7c0c3e75",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-10-27T21:55:45.046644Z",
     "iopub.status.busy": "2024-10-27T21:55:45.044844Z",
     "iopub.status.idle": "2024-10-27T21:55:45.351055Z",
     "shell.execute_reply": "2024-10-27T21:55:45.348768Z"
    },
    "papermill": {
     "duration": 0.315475,
     "end_time": "2024-10-27T21:55:45.354201",
     "exception": false,
     "start_time": "2024-10-27T21:55:45.038726",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 15</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Id</th><th scope=col>ActivityDate</th><th scope=col>TotalSteps</th><th scope=col>TotalDistance</th><th scope=col>TrackerDistance</th><th scope=col>LoggedActivitiesDistance</th><th scope=col>VeryActiveDistance</th><th scope=col>ModeratelyActiveDistance</th><th scope=col>LightActiveDistance</th><th scope=col>SedentaryActiveDistance</th><th scope=col>VeryActiveMinutes</th><th scope=col>FairlyActiveMinutes</th><th scope=col>LightlyActiveMinutes</th><th scope=col>SedentaryMinutes</th><th scope=col>Calories</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>1503960366</td><td>3/25/2016</td><td>11004</td><td> 7.11</td><td> 7.11</td><td>0</td><td>2.57</td><td>0.46</td><td>4.07</td><td>0</td><td>33</td><td>12</td><td>205</td><td> 804</td><td>1819</td></tr>\n",
       "\t<tr><td>1503960366</td><td>3/26/2016</td><td>17609</td><td>11.55</td><td>11.55</td><td>0</td><td>6.92</td><td>0.73</td><td>3.91</td><td>0</td><td>89</td><td>17</td><td>274</td><td> 588</td><td>2154</td></tr>\n",
       "\t<tr><td>1503960366</td><td>3/27/2016</td><td>12736</td><td> 8.53</td><td> 8.53</td><td>0</td><td>4.66</td><td>0.16</td><td>3.71</td><td>0</td><td>56</td><td> 5</td><td>268</td><td> 605</td><td>1944</td></tr>\n",
       "\t<tr><td>1503960366</td><td>3/28/2016</td><td>13231</td><td> 8.93</td><td> 8.93</td><td>0</td><td>3.19</td><td>0.79</td><td>4.95</td><td>0</td><td>39</td><td>20</td><td>224</td><td>1080</td><td>1932</td></tr>\n",
       "\t<tr><td>1503960366</td><td>3/29/2016</td><td>12041</td><td> 7.85</td><td> 7.85</td><td>0</td><td>2.16</td><td>1.09</td><td>4.61</td><td>0</td><td>28</td><td>28</td><td>243</td><td> 763</td><td>1886</td></tr>\n",
       "\t<tr><td>1503960366</td><td>3/30/2016</td><td>10970</td><td> 7.16</td><td> 7.16</td><td>0</td><td>2.36</td><td>0.51</td><td>4.29</td><td>0</td><td>30</td><td>13</td><td>223</td><td>1174</td><td>1820</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 15\n",
       "\\begin{tabular}{lllllllllllllll}\n",
       " Id & ActivityDate & TotalSteps & TotalDistance & TrackerDistance & LoggedActivitiesDistance & VeryActiveDistance & ModeratelyActiveDistance & LightActiveDistance & SedentaryActiveDistance & VeryActiveMinutes & FairlyActiveMinutes & LightlyActiveMinutes & SedentaryMinutes & Calories\\\\\n",
       " <dbl> & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 1503960366 & 3/25/2016 & 11004 &  7.11 &  7.11 & 0 & 2.57 & 0.46 & 4.07 & 0 & 33 & 12 & 205 &  804 & 1819\\\\\n",
       "\t 1503960366 & 3/26/2016 & 17609 & 11.55 & 11.55 & 0 & 6.92 & 0.73 & 3.91 & 0 & 89 & 17 & 274 &  588 & 2154\\\\\n",
       "\t 1503960366 & 3/27/2016 & 12736 &  8.53 &  8.53 & 0 & 4.66 & 0.16 & 3.71 & 0 & 56 &  5 & 268 &  605 & 1944\\\\\n",
       "\t 1503960366 & 3/28/2016 & 13231 &  8.93 &  8.93 & 0 & 3.19 & 0.79 & 4.95 & 0 & 39 & 20 & 224 & 1080 & 1932\\\\\n",
       "\t 1503960366 & 3/29/2016 & 12041 &  7.85 &  7.85 & 0 & 2.16 & 1.09 & 4.61 & 0 & 28 & 28 & 243 &  763 & 1886\\\\\n",
       "\t 1503960366 & 3/30/2016 & 10970 &  7.16 &  7.16 & 0 & 2.36 & 0.51 & 4.29 & 0 & 30 & 13 & 223 & 1174 & 1820\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 15\n",
       "\n",
       "| Id &lt;dbl&gt; | ActivityDate &lt;chr&gt; | TotalSteps &lt;dbl&gt; | TotalDistance &lt;dbl&gt; | TrackerDistance &lt;dbl&gt; | LoggedActivitiesDistance &lt;dbl&gt; | VeryActiveDistance &lt;dbl&gt; | ModeratelyActiveDistance &lt;dbl&gt; | LightActiveDistance &lt;dbl&gt; | SedentaryActiveDistance &lt;dbl&gt; | VeryActiveMinutes &lt;dbl&gt; | FairlyActiveMinutes &lt;dbl&gt; | LightlyActiveMinutes &lt;dbl&gt; | SedentaryMinutes &lt;dbl&gt; | Calories &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1503960366 | 3/25/2016 | 11004 |  7.11 |  7.11 | 0 | 2.57 | 0.46 | 4.07 | 0 | 33 | 12 | 205 |  804 | 1819 |\n",
       "| 1503960366 | 3/26/2016 | 17609 | 11.55 | 11.55 | 0 | 6.92 | 0.73 | 3.91 | 0 | 89 | 17 | 274 |  588 | 2154 |\n",
       "| 1503960366 | 3/27/2016 | 12736 |  8.53 |  8.53 | 0 | 4.66 | 0.16 | 3.71 | 0 | 56 |  5 | 268 |  605 | 1944 |\n",
       "| 1503960366 | 3/28/2016 | 13231 |  8.93 |  8.93 | 0 | 3.19 | 0.79 | 4.95 | 0 | 39 | 20 | 224 | 1080 | 1932 |\n",
       "| 1503960366 | 3/29/2016 | 12041 |  7.85 |  7.85 | 0 | 2.16 | 1.09 | 4.61 | 0 | 28 | 28 | 243 |  763 | 1886 |\n",
       "| 1503960366 | 3/30/2016 | 10970 |  7.16 |  7.16 | 0 | 2.36 | 0.51 | 4.29 | 0 | 30 | 13 | 223 | 1174 | 1820 |\n",
       "\n"
      ],
      "text/plain": [
       "  Id         ActivityDate TotalSteps TotalDistance TrackerDistance\n",
       "1 1503960366 3/25/2016    11004       7.11          7.11          \n",
       "2 1503960366 3/26/2016    17609      11.55         11.55          \n",
       "3 1503960366 3/27/2016    12736       8.53          8.53          \n",
       "4 1503960366 3/28/2016    13231       8.93          8.93          \n",
       "5 1503960366 3/29/2016    12041       7.85          7.85          \n",
       "6 1503960366 3/30/2016    10970       7.16          7.16          \n",
       "  LoggedActivitiesDistance VeryActiveDistance ModeratelyActiveDistance\n",
       "1 0                        2.57               0.46                    \n",
       "2 0                        6.92               0.73                    \n",
       "3 0                        4.66               0.16                    \n",
       "4 0                        3.19               0.79                    \n",
       "5 0                        2.16               1.09                    \n",
       "6 0                        2.36               0.51                    \n",
       "  LightActiveDistance SedentaryActiveDistance VeryActiveMinutes\n",
       "1 4.07                0                       33               \n",
       "2 3.91                0                       89               \n",
       "3 3.71                0                       56               \n",
       "4 4.95                0                       39               \n",
       "5 4.61                0                       28               \n",
       "6 4.29                0                       30               \n",
       "  FairlyActiveMinutes LightlyActiveMinutes SedentaryMinutes Calories\n",
       "1 12                  205                   804             1819    \n",
       "2 17                  274                   588             2154    \n",
       "3  5                  268                   605             1944    \n",
       "4 20                  224                  1080             1932    \n",
       "5 28                  243                   763             1886    \n",
       "6 13                  223                  1174             1820    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Id</th><th scope=col>Time</th><th scope=col>Value</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>2022484408</td><td>4/1/2016 7:54:00 AM</td><td> 93</td></tr>\n",
       "\t<tr><td>2022484408</td><td>4/1/2016 7:54:05 AM</td><td> 91</td></tr>\n",
       "\t<tr><td>2022484408</td><td>4/1/2016 7:54:10 AM</td><td> 96</td></tr>\n",
       "\t<tr><td>2022484408</td><td>4/1/2016 7:54:15 AM</td><td> 98</td></tr>\n",
       "\t<tr><td>2022484408</td><td>4/1/2016 7:54:20 AM</td><td>100</td></tr>\n",
       "\t<tr><td>2022484408</td><td>4/1/2016 7:54:25 AM</td><td>101</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 3\n",
       "\\begin{tabular}{lll}\n",
       " Id & Time & Value\\\\\n",
       " <dbl> & <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 2022484408 & 4/1/2016 7:54:00 AM &  93\\\\\n",
       "\t 2022484408 & 4/1/2016 7:54:05 AM &  91\\\\\n",
       "\t 2022484408 & 4/1/2016 7:54:10 AM &  96\\\\\n",
       "\t 2022484408 & 4/1/2016 7:54:15 AM &  98\\\\\n",
       "\t 2022484408 & 4/1/2016 7:54:20 AM & 100\\\\\n",
       "\t 2022484408 & 4/1/2016 7:54:25 AM & 101\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 3\n",
       "\n",
       "| Id &lt;dbl&gt; | Time &lt;chr&gt; | Value &lt;dbl&gt; |\n",
       "|---|---|---|\n",
       "| 2022484408 | 4/1/2016 7:54:00 AM |  93 |\n",
       "| 2022484408 | 4/1/2016 7:54:05 AM |  91 |\n",
       "| 2022484408 | 4/1/2016 7:54:10 AM |  96 |\n",
       "| 2022484408 | 4/1/2016 7:54:15 AM |  98 |\n",
       "| 2022484408 | 4/1/2016 7:54:20 AM | 100 |\n",
       "| 2022484408 | 4/1/2016 7:54:25 AM | 101 |\n",
       "\n"
      ],
      "text/plain": [
       "  Id         Time                Value\n",
       "1 2022484408 4/1/2016 7:54:00 AM  93  \n",
       "2 2022484408 4/1/2016 7:54:05 AM  91  \n",
       "3 2022484408 4/1/2016 7:54:10 AM  96  \n",
       "4 2022484408 4/1/2016 7:54:15 AM  98  \n",
       "5 2022484408 4/1/2016 7:54:20 AM 100  \n",
       "6 2022484408 4/1/2016 7:54:25 AM 101  "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Id</th><th scope=col>ActivityHour</th><th scope=col>Calories</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>1503960366</td><td>3/12/2016 12:00:00 AM</td><td>48</td></tr>\n",
       "\t<tr><td>1503960366</td><td>3/12/2016 1:00:00 AM </td><td>48</td></tr>\n",
       "\t<tr><td>1503960366</td><td>3/12/2016 2:00:00 AM </td><td>48</td></tr>\n",
       "\t<tr><td>1503960366</td><td>3/12/2016 3:00:00 AM </td><td>48</td></tr>\n",
       "\t<tr><td>1503960366</td><td>3/12/2016 4:00:00 AM </td><td>48</td></tr>\n",
       "\t<tr><td>1503960366</td><td>3/12/2016 5:00:00 AM </td><td>48</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 3\n",
       "\\begin{tabular}{lll}\n",
       " Id & ActivityHour & Calories\\\\\n",
       " <dbl> & <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 1503960366 & 3/12/2016 12:00:00 AM & 48\\\\\n",
       "\t 1503960366 & 3/12/2016 1:00:00 AM  & 48\\\\\n",
       "\t 1503960366 & 3/12/2016 2:00:00 AM  & 48\\\\\n",
       "\t 1503960366 & 3/12/2016 3:00:00 AM  & 48\\\\\n",
       "\t 1503960366 & 3/12/2016 4:00:00 AM  & 48\\\\\n",
       "\t 1503960366 & 3/12/2016 5:00:00 AM  & 48\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 3\n",
       "\n",
       "| Id &lt;dbl&gt; | ActivityHour &lt;chr&gt; | Calories &lt;dbl&gt; |\n",
       "|---|---|---|\n",
       "| 1503960366 | 3/12/2016 12:00:00 AM | 48 |\n",
       "| 1503960366 | 3/12/2016 1:00:00 AM  | 48 |\n",
       "| 1503960366 | 3/12/2016 2:00:00 AM  | 48 |\n",
       "| 1503960366 | 3/12/2016 3:00:00 AM  | 48 |\n",
       "| 1503960366 | 3/12/2016 4:00:00 AM  | 48 |\n",
       "| 1503960366 | 3/12/2016 5:00:00 AM  | 48 |\n",
       "\n"
      ],
      "text/plain": [
       "  Id         ActivityHour          Calories\n",
       "1 1503960366 3/12/2016 12:00:00 AM 48      \n",
       "2 1503960366 3/12/2016 1:00:00 AM  48      \n",
       "3 1503960366 3/12/2016 2:00:00 AM  48      \n",
       "4 1503960366 3/12/2016 3:00:00 AM  48      \n",
       "5 1503960366 3/12/2016 4:00:00 AM  48      \n",
       "6 1503960366 3/12/2016 5:00:00 AM  48      "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Id</th><th scope=col>ActivityHour</th><th scope=col>TotalIntensity</th><th scope=col>AverageIntensity</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>1503960366</td><td>3/12/2016 12:00:00 AM</td><td>0</td><td>0</td></tr>\n",
       "\t<tr><td>1503960366</td><td>3/12/2016 1:00:00 AM </td><td>0</td><td>0</td></tr>\n",
       "\t<tr><td>1503960366</td><td>3/12/2016 2:00:00 AM </td><td>0</td><td>0</td></tr>\n",
       "\t<tr><td>1503960366</td><td>3/12/2016 3:00:00 AM </td><td>0</td><td>0</td></tr>\n",
       "\t<tr><td>1503960366</td><td>3/12/2016 4:00:00 AM </td><td>0</td><td>0</td></tr>\n",
       "\t<tr><td>1503960366</td><td>3/12/2016 5:00:00 AM </td><td>0</td><td>0</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 4\n",
       "\\begin{tabular}{llll}\n",
       " Id & ActivityHour & TotalIntensity & AverageIntensity\\\\\n",
       " <dbl> & <chr> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 1503960366 & 3/12/2016 12:00:00 AM & 0 & 0\\\\\n",
       "\t 1503960366 & 3/12/2016 1:00:00 AM  & 0 & 0\\\\\n",
       "\t 1503960366 & 3/12/2016 2:00:00 AM  & 0 & 0\\\\\n",
       "\t 1503960366 & 3/12/2016 3:00:00 AM  & 0 & 0\\\\\n",
       "\t 1503960366 & 3/12/2016 4:00:00 AM  & 0 & 0\\\\\n",
       "\t 1503960366 & 3/12/2016 5:00:00 AM  & 0 & 0\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 4\n",
       "\n",
       "| Id &lt;dbl&gt; | ActivityHour &lt;chr&gt; | TotalIntensity &lt;dbl&gt; | AverageIntensity &lt;dbl&gt; |\n",
       "|---|---|---|---|\n",
       "| 1503960366 | 3/12/2016 12:00:00 AM | 0 | 0 |\n",
       "| 1503960366 | 3/12/2016 1:00:00 AM  | 0 | 0 |\n",
       "| 1503960366 | 3/12/2016 2:00:00 AM  | 0 | 0 |\n",
       "| 1503960366 | 3/12/2016 3:00:00 AM  | 0 | 0 |\n",
       "| 1503960366 | 3/12/2016 4:00:00 AM  | 0 | 0 |\n",
       "| 1503960366 | 3/12/2016 5:00:00 AM  | 0 | 0 |\n",
       "\n"
      ],
      "text/plain": [
       "  Id         ActivityHour          TotalIntensity AverageIntensity\n",
       "1 1503960366 3/12/2016 12:00:00 AM 0              0               \n",
       "2 1503960366 3/12/2016 1:00:00 AM  0              0               \n",
       "3 1503960366 3/12/2016 2:00:00 AM  0              0               \n",
       "4 1503960366 3/12/2016 3:00:00 AM  0              0               \n",
       "5 1503960366 3/12/2016 4:00:00 AM  0              0               \n",
       "6 1503960366 3/12/2016 5:00:00 AM  0              0               "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Id</th><th scope=col>ActivityHour</th><th scope=col>StepTotal</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>1503960366</td><td>3/12/2016 12:00:00 AM</td><td>0</td></tr>\n",
       "\t<tr><td>1503960366</td><td>3/12/2016 1:00:00 AM </td><td>0</td></tr>\n",
       "\t<tr><td>1503960366</td><td>3/12/2016 2:00:00 AM </td><td>0</td></tr>\n",
       "\t<tr><td>1503960366</td><td>3/12/2016 3:00:00 AM </td><td>0</td></tr>\n",
       "\t<tr><td>1503960366</td><td>3/12/2016 4:00:00 AM </td><td>0</td></tr>\n",
       "\t<tr><td>1503960366</td><td>3/12/2016 5:00:00 AM </td><td>0</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 3\n",
       "\\begin{tabular}{lll}\n",
       " Id & ActivityHour & StepTotal\\\\\n",
       " <dbl> & <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 1503960366 & 3/12/2016 12:00:00 AM & 0\\\\\n",
       "\t 1503960366 & 3/12/2016 1:00:00 AM  & 0\\\\\n",
       "\t 1503960366 & 3/12/2016 2:00:00 AM  & 0\\\\\n",
       "\t 1503960366 & 3/12/2016 3:00:00 AM  & 0\\\\\n",
       "\t 1503960366 & 3/12/2016 4:00:00 AM  & 0\\\\\n",
       "\t 1503960366 & 3/12/2016 5:00:00 AM  & 0\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 3\n",
       "\n",
       "| Id &lt;dbl&gt; | ActivityHour &lt;chr&gt; | StepTotal &lt;dbl&gt; |\n",
       "|---|---|---|\n",
       "| 1503960366 | 3/12/2016 12:00:00 AM | 0 |\n",
       "| 1503960366 | 3/12/2016 1:00:00 AM  | 0 |\n",
       "| 1503960366 | 3/12/2016 2:00:00 AM  | 0 |\n",
       "| 1503960366 | 3/12/2016 3:00:00 AM  | 0 |\n",
       "| 1503960366 | 3/12/2016 4:00:00 AM  | 0 |\n",
       "| 1503960366 | 3/12/2016 5:00:00 AM  | 0 |\n",
       "\n"
      ],
      "text/plain": [
       "  Id         ActivityHour          StepTotal\n",
       "1 1503960366 3/12/2016 12:00:00 AM 0        \n",
       "2 1503960366 3/12/2016 1:00:00 AM  0        \n",
       "3 1503960366 3/12/2016 2:00:00 AM  0        \n",
       "4 1503960366 3/12/2016 3:00:00 AM  0        \n",
       "5 1503960366 3/12/2016 4:00:00 AM  0        \n",
       "6 1503960366 3/12/2016 5:00:00 AM  0        "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Id</th><th scope=col>ActivityMinute</th><th scope=col>Calories</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>1503960366</td><td>3/12/2016 12:00:00 AM</td><td>0.7973</td></tr>\n",
       "\t<tr><td>1503960366</td><td>3/12/2016 12:01:00 AM</td><td>0.7973</td></tr>\n",
       "\t<tr><td>1503960366</td><td>3/12/2016 12:02:00 AM</td><td>0.7973</td></tr>\n",
       "\t<tr><td>1503960366</td><td>3/12/2016 12:03:00 AM</td><td>0.7973</td></tr>\n",
       "\t<tr><td>1503960366</td><td>3/12/2016 12:04:00 AM</td><td>0.7973</td></tr>\n",
       "\t<tr><td>1503960366</td><td>3/12/2016 12:05:00 AM</td><td>0.7973</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 3\n",
       "\\begin{tabular}{lll}\n",
       " Id & ActivityMinute & Calories\\\\\n",
       " <dbl> & <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 1503960366 & 3/12/2016 12:00:00 AM & 0.7973\\\\\n",
       "\t 1503960366 & 3/12/2016 12:01:00 AM & 0.7973\\\\\n",
       "\t 1503960366 & 3/12/2016 12:02:00 AM & 0.7973\\\\\n",
       "\t 1503960366 & 3/12/2016 12:03:00 AM & 0.7973\\\\\n",
       "\t 1503960366 & 3/12/2016 12:04:00 AM & 0.7973\\\\\n",
       "\t 1503960366 & 3/12/2016 12:05:00 AM & 0.7973\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 3\n",
       "\n",
       "| Id &lt;dbl&gt; | ActivityMinute &lt;chr&gt; | Calories &lt;dbl&gt; |\n",
       "|---|---|---|\n",
       "| 1503960366 | 3/12/2016 12:00:00 AM | 0.7973 |\n",
       "| 1503960366 | 3/12/2016 12:01:00 AM | 0.7973 |\n",
       "| 1503960366 | 3/12/2016 12:02:00 AM | 0.7973 |\n",
       "| 1503960366 | 3/12/2016 12:03:00 AM | 0.7973 |\n",
       "| 1503960366 | 3/12/2016 12:04:00 AM | 0.7973 |\n",
       "| 1503960366 | 3/12/2016 12:05:00 AM | 0.7973 |\n",
       "\n"
      ],
      "text/plain": [
       "  Id         ActivityMinute        Calories\n",
       "1 1503960366 3/12/2016 12:00:00 AM 0.7973  \n",
       "2 1503960366 3/12/2016 12:01:00 AM 0.7973  \n",
       "3 1503960366 3/12/2016 12:02:00 AM 0.7973  \n",
       "4 1503960366 3/12/2016 12:03:00 AM 0.7973  \n",
       "5 1503960366 3/12/2016 12:04:00 AM 0.7973  \n",
       "6 1503960366 3/12/2016 12:05:00 AM 0.7973  "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Id</th><th scope=col>ActivityMinute</th><th scope=col>Intensity</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>1503960366</td><td>3/12/2016 12:00:00 AM</td><td>0</td></tr>\n",
       "\t<tr><td>1503960366</td><td>3/12/2016 12:01:00 AM</td><td>0</td></tr>\n",
       "\t<tr><td>1503960366</td><td>3/12/2016 12:02:00 AM</td><td>0</td></tr>\n",
       "\t<tr><td>1503960366</td><td>3/12/2016 12:03:00 AM</td><td>0</td></tr>\n",
       "\t<tr><td>1503960366</td><td>3/12/2016 12:04:00 AM</td><td>0</td></tr>\n",
       "\t<tr><td>1503960366</td><td>3/12/2016 12:05:00 AM</td><td>0</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 3\n",
       "\\begin{tabular}{lll}\n",
       " Id & ActivityMinute & Intensity\\\\\n",
       " <dbl> & <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 1503960366 & 3/12/2016 12:00:00 AM & 0\\\\\n",
       "\t 1503960366 & 3/12/2016 12:01:00 AM & 0\\\\\n",
       "\t 1503960366 & 3/12/2016 12:02:00 AM & 0\\\\\n",
       "\t 1503960366 & 3/12/2016 12:03:00 AM & 0\\\\\n",
       "\t 1503960366 & 3/12/2016 12:04:00 AM & 0\\\\\n",
       "\t 1503960366 & 3/12/2016 12:05:00 AM & 0\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 3\n",
       "\n",
       "| Id &lt;dbl&gt; | ActivityMinute &lt;chr&gt; | Intensity &lt;dbl&gt; |\n",
       "|---|---|---|\n",
       "| 1503960366 | 3/12/2016 12:00:00 AM | 0 |\n",
       "| 1503960366 | 3/12/2016 12:01:00 AM | 0 |\n",
       "| 1503960366 | 3/12/2016 12:02:00 AM | 0 |\n",
       "| 1503960366 | 3/12/2016 12:03:00 AM | 0 |\n",
       "| 1503960366 | 3/12/2016 12:04:00 AM | 0 |\n",
       "| 1503960366 | 3/12/2016 12:05:00 AM | 0 |\n",
       "\n"
      ],
      "text/plain": [
       "  Id         ActivityMinute        Intensity\n",
       "1 1503960366 3/12/2016 12:00:00 AM 0        \n",
       "2 1503960366 3/12/2016 12:01:00 AM 0        \n",
       "3 1503960366 3/12/2016 12:02:00 AM 0        \n",
       "4 1503960366 3/12/2016 12:03:00 AM 0        \n",
       "5 1503960366 3/12/2016 12:04:00 AM 0        \n",
       "6 1503960366 3/12/2016 12:05:00 AM 0        "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Id</th><th scope=col>ActivityMinute</th><th scope=col>METs</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>1503960366</td><td>3/12/2016 12:00:00 AM</td><td>10</td></tr>\n",
       "\t<tr><td>1503960366</td><td>3/12/2016 12:01:00 AM</td><td>10</td></tr>\n",
       "\t<tr><td>1503960366</td><td>3/12/2016 12:02:00 AM</td><td>10</td></tr>\n",
       "\t<tr><td>1503960366</td><td>3/12/2016 12:03:00 AM</td><td>10</td></tr>\n",
       "\t<tr><td>1503960366</td><td>3/12/2016 12:04:00 AM</td><td>10</td></tr>\n",
       "\t<tr><td>1503960366</td><td>3/12/2016 12:05:00 AM</td><td>10</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 3\n",
       "\\begin{tabular}{lll}\n",
       " Id & ActivityMinute & METs\\\\\n",
       " <dbl> & <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 1503960366 & 3/12/2016 12:00:00 AM & 10\\\\\n",
       "\t 1503960366 & 3/12/2016 12:01:00 AM & 10\\\\\n",
       "\t 1503960366 & 3/12/2016 12:02:00 AM & 10\\\\\n",
       "\t 1503960366 & 3/12/2016 12:03:00 AM & 10\\\\\n",
       "\t 1503960366 & 3/12/2016 12:04:00 AM & 10\\\\\n",
       "\t 1503960366 & 3/12/2016 12:05:00 AM & 10\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 3\n",
       "\n",
       "| Id &lt;dbl&gt; | ActivityMinute &lt;chr&gt; | METs &lt;dbl&gt; |\n",
       "|---|---|---|\n",
       "| 1503960366 | 3/12/2016 12:00:00 AM | 10 |\n",
       "| 1503960366 | 3/12/2016 12:01:00 AM | 10 |\n",
       "| 1503960366 | 3/12/2016 12:02:00 AM | 10 |\n",
       "| 1503960366 | 3/12/2016 12:03:00 AM | 10 |\n",
       "| 1503960366 | 3/12/2016 12:04:00 AM | 10 |\n",
       "| 1503960366 | 3/12/2016 12:05:00 AM | 10 |\n",
       "\n"
      ],
      "text/plain": [
       "  Id         ActivityMinute        METs\n",
       "1 1503960366 3/12/2016 12:00:00 AM 10  \n",
       "2 1503960366 3/12/2016 12:01:00 AM 10  \n",
       "3 1503960366 3/12/2016 12:02:00 AM 10  \n",
       "4 1503960366 3/12/2016 12:03:00 AM 10  \n",
       "5 1503960366 3/12/2016 12:04:00 AM 10  \n",
       "6 1503960366 3/12/2016 12:05:00 AM 10  "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Id</th><th scope=col>date</th><th scope=col>value</th><th scope=col>logId</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>1503960366</td><td>3/13/2016 2:39:30 AM</td><td>1</td><td>11114919637</td></tr>\n",
       "\t<tr><td>1503960366</td><td>3/13/2016 2:40:30 AM</td><td>1</td><td>11114919637</td></tr>\n",
       "\t<tr><td>1503960366</td><td>3/13/2016 2:41:30 AM</td><td>1</td><td>11114919637</td></tr>\n",
       "\t<tr><td>1503960366</td><td>3/13/2016 2:42:30 AM</td><td>1</td><td>11114919637</td></tr>\n",
       "\t<tr><td>1503960366</td><td>3/13/2016 2:43:30 AM</td><td>1</td><td>11114919637</td></tr>\n",
       "\t<tr><td>1503960366</td><td>3/13/2016 2:44:30 AM</td><td>1</td><td>11114919637</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 4\n",
       "\\begin{tabular}{llll}\n",
       " Id & date & value & logId\\\\\n",
       " <dbl> & <chr> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 1503960366 & 3/13/2016 2:39:30 AM & 1 & 11114919637\\\\\n",
       "\t 1503960366 & 3/13/2016 2:40:30 AM & 1 & 11114919637\\\\\n",
       "\t 1503960366 & 3/13/2016 2:41:30 AM & 1 & 11114919637\\\\\n",
       "\t 1503960366 & 3/13/2016 2:42:30 AM & 1 & 11114919637\\\\\n",
       "\t 1503960366 & 3/13/2016 2:43:30 AM & 1 & 11114919637\\\\\n",
       "\t 1503960366 & 3/13/2016 2:44:30 AM & 1 & 11114919637\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 4\n",
       "\n",
       "| Id &lt;dbl&gt; | date &lt;chr&gt; | value &lt;dbl&gt; | logId &lt;dbl&gt; |\n",
       "|---|---|---|---|\n",
       "| 1503960366 | 3/13/2016 2:39:30 AM | 1 | 11114919637 |\n",
       "| 1503960366 | 3/13/2016 2:40:30 AM | 1 | 11114919637 |\n",
       "| 1503960366 | 3/13/2016 2:41:30 AM | 1 | 11114919637 |\n",
       "| 1503960366 | 3/13/2016 2:42:30 AM | 1 | 11114919637 |\n",
       "| 1503960366 | 3/13/2016 2:43:30 AM | 1 | 11114919637 |\n",
       "| 1503960366 | 3/13/2016 2:44:30 AM | 1 | 11114919637 |\n",
       "\n"
      ],
      "text/plain": [
       "  Id         date                 value logId      \n",
       "1 1503960366 3/13/2016 2:39:30 AM 1     11114919637\n",
       "2 1503960366 3/13/2016 2:40:30 AM 1     11114919637\n",
       "3 1503960366 3/13/2016 2:41:30 AM 1     11114919637\n",
       "4 1503960366 3/13/2016 2:42:30 AM 1     11114919637\n",
       "5 1503960366 3/13/2016 2:43:30 AM 1     11114919637\n",
       "6 1503960366 3/13/2016 2:44:30 AM 1     11114919637"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Id</th><th scope=col>ActivityMinute</th><th scope=col>Steps</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>1503960366</td><td>3/12/2016 12:00:00 AM</td><td>0</td></tr>\n",
       "\t<tr><td>1503960366</td><td>3/12/2016 12:01:00 AM</td><td>0</td></tr>\n",
       "\t<tr><td>1503960366</td><td>3/12/2016 12:02:00 AM</td><td>0</td></tr>\n",
       "\t<tr><td>1503960366</td><td>3/12/2016 12:03:00 AM</td><td>0</td></tr>\n",
       "\t<tr><td>1503960366</td><td>3/12/2016 12:04:00 AM</td><td>0</td></tr>\n",
       "\t<tr><td>1503960366</td><td>3/12/2016 12:05:00 AM</td><td>0</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 3\n",
       "\\begin{tabular}{lll}\n",
       " Id & ActivityMinute & Steps\\\\\n",
       " <dbl> & <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 1503960366 & 3/12/2016 12:00:00 AM & 0\\\\\n",
       "\t 1503960366 & 3/12/2016 12:01:00 AM & 0\\\\\n",
       "\t 1503960366 & 3/12/2016 12:02:00 AM & 0\\\\\n",
       "\t 1503960366 & 3/12/2016 12:03:00 AM & 0\\\\\n",
       "\t 1503960366 & 3/12/2016 12:04:00 AM & 0\\\\\n",
       "\t 1503960366 & 3/12/2016 12:05:00 AM & 0\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 3\n",
       "\n",
       "| Id &lt;dbl&gt; | ActivityMinute &lt;chr&gt; | Steps &lt;dbl&gt; |\n",
       "|---|---|---|\n",
       "| 1503960366 | 3/12/2016 12:00:00 AM | 0 |\n",
       "| 1503960366 | 3/12/2016 12:01:00 AM | 0 |\n",
       "| 1503960366 | 3/12/2016 12:02:00 AM | 0 |\n",
       "| 1503960366 | 3/12/2016 12:03:00 AM | 0 |\n",
       "| 1503960366 | 3/12/2016 12:04:00 AM | 0 |\n",
       "| 1503960366 | 3/12/2016 12:05:00 AM | 0 |\n",
       "\n"
      ],
      "text/plain": [
       "  Id         ActivityMinute        Steps\n",
       "1 1503960366 3/12/2016 12:00:00 AM 0    \n",
       "2 1503960366 3/12/2016 12:01:00 AM 0    \n",
       "3 1503960366 3/12/2016 12:02:00 AM 0    \n",
       "4 1503960366 3/12/2016 12:03:00 AM 0    \n",
       "5 1503960366 3/12/2016 12:04:00 AM 0    \n",
       "6 1503960366 3/12/2016 12:05:00 AM 0    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 8</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Id</th><th scope=col>Date</th><th scope=col>WeightKg</th><th scope=col>WeightPounds</th><th scope=col>Fat</th><th scope=col>BMI</th><th scope=col>IsManualReport</th><th scope=col>LogId</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;lgl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>1503960366</td><td>4/5/2016 11:59:59 PM</td><td> 53.3</td><td>117.5064</td><td>22</td><td>22.97</td><td> TRUE</td><td>1.459901e+12</td></tr>\n",
       "\t<tr><td>1927972279</td><td>4/10/2016 6:33:26 PM</td><td>129.6</td><td>285.7191</td><td>NA</td><td>46.17</td><td>FALSE</td><td>1.460313e+12</td></tr>\n",
       "\t<tr><td>2347167796</td><td>4/3/2016 11:59:59 PM</td><td> 63.4</td><td>139.7731</td><td>10</td><td>24.77</td><td> TRUE</td><td>1.459728e+12</td></tr>\n",
       "\t<tr><td>2873212765</td><td>4/6/2016 11:59:59 PM</td><td> 56.7</td><td>125.0021</td><td>NA</td><td>21.45</td><td> TRUE</td><td>1.459987e+12</td></tr>\n",
       "\t<tr><td>2873212765</td><td>4/7/2016 11:59:59 PM</td><td> 57.2</td><td>126.1044</td><td>NA</td><td>21.65</td><td> TRUE</td><td>1.460074e+12</td></tr>\n",
       "\t<tr><td>2891001357</td><td>4/5/2016 11:59:59 PM</td><td> 88.4</td><td>194.8886</td><td>NA</td><td>25.03</td><td> TRUE</td><td>1.459901e+12</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 8\n",
       "\\begin{tabular}{llllllll}\n",
       " Id & Date & WeightKg & WeightPounds & Fat & BMI & IsManualReport & LogId\\\\\n",
       " <dbl> & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <lgl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 1503960366 & 4/5/2016 11:59:59 PM &  53.3 & 117.5064 & 22 & 22.97 &  TRUE & 1.459901e+12\\\\\n",
       "\t 1927972279 & 4/10/2016 6:33:26 PM & 129.6 & 285.7191 & NA & 46.17 & FALSE & 1.460313e+12\\\\\n",
       "\t 2347167796 & 4/3/2016 11:59:59 PM &  63.4 & 139.7731 & 10 & 24.77 &  TRUE & 1.459728e+12\\\\\n",
       "\t 2873212765 & 4/6/2016 11:59:59 PM &  56.7 & 125.0021 & NA & 21.45 &  TRUE & 1.459987e+12\\\\\n",
       "\t 2873212765 & 4/7/2016 11:59:59 PM &  57.2 & 126.1044 & NA & 21.65 &  TRUE & 1.460074e+12\\\\\n",
       "\t 2891001357 & 4/5/2016 11:59:59 PM &  88.4 & 194.8886 & NA & 25.03 &  TRUE & 1.459901e+12\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 8\n",
       "\n",
       "| Id &lt;dbl&gt; | Date &lt;chr&gt; | WeightKg &lt;dbl&gt; | WeightPounds &lt;dbl&gt; | Fat &lt;dbl&gt; | BMI &lt;dbl&gt; | IsManualReport &lt;lgl&gt; | LogId &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|\n",
       "| 1503960366 | 4/5/2016 11:59:59 PM |  53.3 | 117.5064 | 22 | 22.97 |  TRUE | 1.459901e+12 |\n",
       "| 1927972279 | 4/10/2016 6:33:26 PM | 129.6 | 285.7191 | NA | 46.17 | FALSE | 1.460313e+12 |\n",
       "| 2347167796 | 4/3/2016 11:59:59 PM |  63.4 | 139.7731 | 10 | 24.77 |  TRUE | 1.459728e+12 |\n",
       "| 2873212765 | 4/6/2016 11:59:59 PM |  56.7 | 125.0021 | NA | 21.45 |  TRUE | 1.459987e+12 |\n",
       "| 2873212765 | 4/7/2016 11:59:59 PM |  57.2 | 126.1044 | NA | 21.65 |  TRUE | 1.460074e+12 |\n",
       "| 2891001357 | 4/5/2016 11:59:59 PM |  88.4 | 194.8886 | NA | 25.03 |  TRUE | 1.459901e+12 |\n",
       "\n"
      ],
      "text/plain": [
       "  Id         Date                 WeightKg WeightPounds Fat BMI  \n",
       "1 1503960366 4/5/2016 11:59:59 PM  53.3    117.5064     22  22.97\n",
       "2 1927972279 4/10/2016 6:33:26 PM 129.6    285.7191     NA  46.17\n",
       "3 2347167796 4/3/2016 11:59:59 PM  63.4    139.7731     10  24.77\n",
       "4 2873212765 4/6/2016 11:59:59 PM  56.7    125.0021     NA  21.45\n",
       "5 2873212765 4/7/2016 11:59:59 PM  57.2    126.1044     NA  21.65\n",
       "6 2891001357 4/5/2016 11:59:59 PM  88.4    194.8886     NA  25.03\n",
       "  IsManualReport LogId       \n",
       "1  TRUE          1.459901e+12\n",
       "2 FALSE          1.460313e+12\n",
       "3  TRUE          1.459728e+12\n",
       "4  TRUE          1.459987e+12\n",
       "5  TRUE          1.460074e+12\n",
       "6  TRUE          1.459901e+12"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Exploración inicial: Ver las primeras filas de cada dataset\n",
    "head(daily_activity)\n",
    "head(heartrate)\n",
    "head(hourly_calories)\n",
    "head(hourly_intensities)\n",
    "head(hourly_steps)\n",
    "head(minute_calories)\n",
    "head(minute_intensities)\n",
    "head(minute_mets)\n",
    "head(minute_sleep)\n",
    "head(minute_steps)\n",
    "head(weight_log)\n",
    "\n",
    "# Documentación:\n",
    "# - `head()`: Nos muestra las primeras filas de cada dataset para entender la estructura de los datos."
   ]
  }
 ],
 "metadata": {
  "kaggle": {
   "accelerator": "none",
   "dataSources": [
    {
     "datasetId": 1041311,
     "sourceId": 7746251,
     "sourceType": "datasetVersion"
    }
   ],
   "dockerImageVersionId": 30749,
   "isGpuEnabled": false,
   "isInternetEnabled": true,
   "language": "r",
   "sourceType": "notebook"
  },
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.4.0"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 54.988643,
   "end_time": "2024-10-27T21:55:45.485686",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2024-10-27T21:54:50.497043",
   "version": "2.6.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
