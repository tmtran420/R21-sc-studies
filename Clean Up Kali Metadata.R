kali_metadata <- read_csv("/Users/tuantran/Library/CloudStorage/OneDrive-IndianaUniversity/Kalifabougou Data/Read-in Data for Data Management/enroll_2011_data_FINAL_pcr_smear_helminth_Hbtype_2015-06-09-10-AM.csv") %>%
  mutate(sample_id = paste0("kali", sprintf("%04d", subj_id))) %>%
  dplyr::select(sample_id, calc.age, Gender, Weight, Anemia, Hb.type, pfpcr) %>%
  dplyr::rename(age = "calc.age",
                gender = "Gender",
                weight = "Weight",
                anemia = "Anemia",
                Hb_type = "Hb.type",
                pf_pcr_status = "pfpcr") %>%
  filter(sample_id %in% sub("\\_.*", "", tolower(refmapped_seurat$Sample.ID)))

write.csv(kali_metadata, file = "all_kali_metadata_reduced.csv", row.names = FALSE)



