#include <string.h>
#include <omnetpp.h>

using namespace omnetpp;

/**
 * We are defining a "HelloNode" class which inherits from OMNeT++'s own
 * "cSimpleModule" class and overrides certain behavior.
 */
class HelloNode : public cSimpleModule {
    protected:
        // The following redefined virtual function holds our own custom logic:
        virtual void initialize() override;
        virtual void handleMessage(cMessage *msg) override;
};

Define_Module(HelloNode); // The module class needs to be registered with OMNeT++

/**
 * Initialize is called at the beginning of the simulation.
 * We want 'nodeA' to send the initial message:
 */
void HelloNode::initialize() {

    if (strcmp("nodeA", getName()) == 0) {
        cMessage *msg = new cMessage("Hello");  // create the message "Hello"
        send(msg, "out");                       // send the message
    }
}
/**
 * handleMessage is called whenever a message arrives at the module.
 * In this simple example, the module just changes the message content
 * and sends it back to the other module again.
 */
void HelloNode::handleMessage(cMessage *msg) {
    if (strcmp("nodeA", getName()) == 0) {      // "nodeA" behavior
        msg->setName("Hello");                  // change the name
        send(msg, "out");                       // send the message
    } else {                                    // "nodeB" behavior
        msg->setName("World");                  // change the name
        send(msg, "out");                       // send the message
    }
}
