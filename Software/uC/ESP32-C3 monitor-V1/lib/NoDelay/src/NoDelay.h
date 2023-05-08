#ifndef __NoDelay__
#define __NoDelay__

#include <Arduino.h>

class NoDelay
{
private:
    unsigned long lastMillis;
    unsigned long interval;

public:
    NoDelay::NoDelay();
    NoDelay::NoDelay(unsigned long interval);

    void NoDelay::begin();

    boolean NoDelay::isTriggered();
    void NoDelay::setInterval(unsigned long interval);
};

#endif