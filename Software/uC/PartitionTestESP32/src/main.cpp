#include <Arduino.h>
#include <esp_partition.h>

void setup()
{
  Serial.begin(115200);
  Serial.println("\n--------------------------------------------------");
  const esp_partition_t *partition = NULL;
  partition = esp_partition_find_first(ESP_PARTITION_TYPE_APP, ESP_PARTITION_SUBTYPE_APP_OTA_0, "app0");
  if (partition != NULL)
  {
    Serial.printf("APP partition addr: 0x%08x; size: %d; label: %s\n", partition->address, partition->size, partition->label);
  }

  partition = esp_partition_find_first(ESP_PARTITION_TYPE_APP, ESP_PARTITION_SUBTYPE_APP_OTA_1, "app1");
  if (partition != NULL)
  {
    Serial.printf("OTA partition addr: 0x%08x; size: %d; label: %s\n", partition->address, partition->size, partition->label);
  }
  else
  {
    Serial.printf("No OTA partition found !\n");
  }

  partition = esp_partition_find_first(ESP_PARTITION_TYPE_DATA, (esp_partition_subtype_t)0x99, "eeprom");
  if (partition != NULL)
  {
    Serial.printf("EEprom partition addr: 0x%08x; size: %d; label: %s\n", partition->address, partition->size, partition->label);
  }

  partition = esp_partition_find_first(ESP_PARTITION_TYPE_DATA, ESP_PARTITION_SUBTYPE_DATA_SPIFFS, "spiffs");
  if (partition != NULL)
  {
    Serial.printf("SPIFFS partition addr: 0x%08x; size: %d; label: %s\n", partition->address, partition->size, partition->label);
  }
}

void loop() {}