function createNewPage(parent) {
    var component = Qt.createComponent("NewPage.qml")
    var newWindow = component.createObject(parent)

    if (newWindow === null)
    {
        console.log("Error creating object.")
    }
}
