function updatePlayerList(playerArray) {
    const table = document.getElementById("playerList");
    table.innerHTML = "";

    for (let i = 0; i < playerArray.length; i++) {
        const player = playerArray[i];
        const row = document.createElement("tr");

        row.innerHTML = `
            <td>${player.name}</td>
            <td>${player.health}</td>
            <td>${player.armor}</td>
            <td>${player.ping}</td>
            <td><button onclick="selectPlayer('${player.name}')">Select</button></td>
        `;

        table.appendChild(row);
    }
}

function selectPlayer(name) {
    document.getElementById("selectedPlayer").value = name;
}

function doAction(action) {
    const player = document.getElementById("selectedPlayer").value;
    if (!player) return alert("❌ Pilih player dulu!");
    mta.triggerEvent("admin:performAction", player, action);
}

function godPower(type) {
    const player = document.getElementById("selectedPlayer").value;
    if (!player) return alert("❌ Pilih player dulu!");
    mta.triggerEvent("admin:godPower", player, type);
}
