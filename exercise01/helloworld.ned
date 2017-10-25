package exercise01;

simple HelloNode
{
    gates:
        input in;
        output out;
}

network HelloNetwork
{
    @display("bgb=351,169");
    submodules:
        nodeA: HelloNode {
            @display("p=92,83");
        }
        nodeB: HelloNode {
            @display("p=244,83");
        }
    connections:
        nodeA.out --> {  delay = 100ms; } --> nodeB.in;
        nodeA.in <-- {  delay = 100ms; } <-- nodeB.out;
}
