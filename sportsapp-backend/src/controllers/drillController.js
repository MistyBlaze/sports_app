exports.getDrills = (req, res) => {
    const drills = [
        { name: "Toe Taps", totalCount: 40 },
        { name: "Dribble Weave", totalCount: 30 },
        { name: "Passing Drills", totalCount: 50 },
        { name: "Shooting Practice", totalCount: 20 },
        { name: "Cone Drills", totalCount: 25 }
    ];

    res.json(drills);
};