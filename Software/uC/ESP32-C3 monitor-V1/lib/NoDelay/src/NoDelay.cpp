#include "NoDelay.h"
#include <Arduino.h>

NoDelay::NoDelay()
{
    this->interval = 500;
}

NoDelay::NoDelay(unsigned long interval)
{
    this->interval = interval;
}

void NoDelay::begin()
{
    this->lastMillis = millis();
}

boolean NoDelay::isTriggered()
{
    if (millis() - this->lastMillis >= this->interval)
    {
        this->lastMillis = millis();
        return true;
    }
    return false;
}

void NoDelay::setInterval(unsigned long interval)
{
    this->interval = interval;
}