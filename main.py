from bluepy.btle import Scanner, DefaultDelegate


class ScanDelegate(DefaultDelegate):
    def __init__(self):
        DefaultDelegate.__init__(self)

    def handleDiscovery(self, dev, isNewDev, isNewData):
        if isNewDev:
            print("Discovered device", dev.addr, dev.rssi)
        else:
            pass
        # elif isNewData:
        #     print("Received new data from", dev.addr)


scanner = Scanner().withDelegate(ScanDelegate())
devices = scanner.scan(10)
a = 0
# for dev in devices:

#     print(f"Device: {dev.addr}, {dev.addrType}, {dev.rssi}")
#     # for (adtype, desc, value) in dev.getScanData():
#     #     print "  %s = %s" % (desc, value)
