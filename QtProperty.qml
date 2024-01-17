import QtQuick 2.0

Item {
    id: root

    QtPropertyItem {
        id: variable
        title: "Variable"
        content: CTRL.type + " m_" + CTRL.name + ";"
    }

    QtPropertyItem {
        id: qproperty
        anchors.top: variable.bottom
        title: "QProperty"
        content: "Q_PROPERTY(" + CTRL.type + " " + CTRL.name + " READ " + CTRL.name
                 + " WRITE set" + CTRL.nameUp + " NOTIFY " + CTRL.name + "Changed)"
    }

    QtPropertyItem {
        id: qsignal
        anchors.top: qproperty.bottom
        title: "Signal"
        content: "void " + CTRL.name + "Changed();"
    }

    QtPropertyItem {
        id: header
        anchors.top: qsignal.bottom
        title: "Header"
        content: "const " + CTRL.type + " &" + CTRL.name + "() const;\nvoid " + "set"
                 + CTRL.nameUp + "(const " + CTRL.type + " &new" + CTRL.nameUp + ");"
    }

    QtPropertyItem {
        id: source
        anchors.top: header.bottom
        title: "Source"
        content: "const " + CTRL.type + " &" + CTRL.obj + "::"+ CTRL.name + "() const\n{\n\treturn m_" + CTRL.name
                 + ";\n}\n\nvoid " + CTRL.obj + "::set" + CTRL.nameUp + "(const " + CTRL.type + " &new" + CTRL.nameUp
                 + ")\n{\n\tif(m_" + CTRL.name + " == new" + CTRL.nameUp + ")\n\t\treturn;\n\tm_" + CTRL.name
                 + " = new" +  CTRL.nameUp + ";\n\temit " + CTRL.name + "Changed();\n}"
    }
}
