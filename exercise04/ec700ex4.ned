//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

package exercise04;

import inet.common.figures.DelegateSignalConfigurator;
import inet.networklayer.configurator.ipv4.IPv4NetworkConfigurator;
import inet.node.inet.INetworkNode;
import inet.physicallayer.contract.packetlevel.IRadioMedium;
import inet.visualizer.contract.IIntegratedVisualizer;


network Ec700ex4
{
    parameters:
        string hostType = default("WirelessHost");
        string mediumType = default("IdealRadioMedium");


        @display("bgb=1082.2625,402.81,lightBlue");
    submodules:
        visualizer: <default("IntegratedCanvasVisualizer")> like IIntegratedVisualizer if hasVisualizer() {
            @display("p=972.3,114.5925");
        }
        configurator: IPv4NetworkConfigurator {
            @display("p=972.3,188.6725");
        }
        radioMedium: <mediumType> like IRadioMedium {
            @display("p=972.3,263.91");
        }
        HostAlice: <hostType> like INetworkNode {
            @display("p=50,170");
        }
        HostBob: <hostType> like INetworkNode {
            @display("p=300,170");
        }
        HostEve: <hostType> like INetworkNode {
            @display("p=500,170");
        }
}
