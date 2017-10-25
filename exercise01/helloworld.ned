package exercise01;

simple HelloNode
{
    gates:
        input in;
        output out;
}

network HelloNetwork
{
    submodules:
        nodeA: HelloNode {
            @display("p=50,30");
        }
        nodeB: HelloNode {
            @display("p=150,30");
        }
    connections:
        nodeA.out --> {  delay = 100ms; } --> nodeB.in;
        nodeA.in <-- {  delay = 100ms; } <-- nodeB.out;
}
