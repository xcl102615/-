package project.util;


import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.io.File;

/**
 * XML文件读取操作
 * Created by wph-pc on 2018/1/2.
 */
public class XMLFile {
    private String fileName = "";//文件路径
    private org.w3c.dom.Document doc = null;//构建xml文档

    public XMLFile(String path) {
        this.fileName = path;
        doc = getDoc();
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    private org.w3c.dom.Document getDoc() {
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        dbf.setIgnoringElementContentWhitespace(true);
        try {
            DocumentBuilder db = dbf.newDocumentBuilder();
            return db.parse(fileName); // 使用dom解析xml文件
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /*获取XML文件的根目录集合*/
    public Element getRoot() {
        if (doc != null)
            return doc.getDocumentElement();
        else
            return null;
    }

    /*获取所有tagName节点的集合*/
    public NodeList getNodes(String tagName) {
        if (doc == null) return null;
        return doc.getElementsByTagName(tagName);
    }


    /*判断当前节点是否存在属性attrName*/
    public boolean existAttribute(Node node, String attrName) {
        if (node == null) return false;
        NamedNodeMap attrs = node.getAttributes();//获取属性节点
        if (attrs == null || attrs.getLength() == 0) return false;
        for (int i = 0; i < attrs.getLength(); i++) {
            if (attrs.item(i).getNodeName().equalsIgnoreCase(attrName.toLowerCase().trim())) return true;
        }
        return false;
    }

    /*获取节点名称为tagName，且节点的ID属性为id*/
    public Node getNode(String tagName, String id) {
        NodeList nodes = getNodes(tagName);
        if (nodes == null) return null;
        for (int i = 0; i < nodes.getLength(); i++) {
            Node temp = nodes.item(i);
            if (existAttribute(temp, "id")) {
                if (((Element) temp).getAttribute("id").equalsIgnoreCase(id.toLowerCase().trim())) return temp;
            }
        }
        return null;
    }

    /*获取节点名称为tagName，属性名称为attrName的值*/
    public String getNodeAttributeValue(String tagName, String attrName) {
        NodeList nodes = getNodes(tagName);
        if (nodes == null) return null;
        for (int i = 0; i < nodes.getLength(); i++) {
            Node temp = nodes.item(i);
            return ((Element) temp).getAttribute(attrName);
        }
        return null;
    }


    public boolean appendNode(String parentID, String nodeName) {
        if (doc == null) return false;
        Element parent = doc.getElementById(parentID);//获取父节点
        if (parent != null) {
            Element node = doc.createElement(nodeName);
            parent.appendChild(node);
            saveXmlFile(doc);
            return true;
        }
        return false;
    }

    public boolean appendNode(String nodeName) {
        if (doc == null) return false;
        Element parent = doc.getDocumentElement();//获取父节点
        if (parent != null) {
            Element node = doc.createElement(nodeName);
            parent.appendChild(node);
            /*文件写入覆盖*/
            saveXmlFile(doc);
            return true;
        }
        return false;
    }

    public boolean appendNode(Element parent, String nodeName) {
        if (doc == null || parent == null) return false;
        if (parent != null) {
            Element node = doc.createElement(nodeName);
            parent.appendChild(node);
            saveXmlFile(doc);
            return true;
        }
        return false;
    }

    public void saveXmlFile(org.w3c.dom.Document doc) {
        TransformerFactory tfactory = TransformerFactory.newInstance();
        try {
            Transformer transformer = tfactory.newTransformer();
            DOMSource source = new DOMSource(doc);
            StreamResult result = new StreamResult(new File(fileName));
            transformer.setOutputProperty("encoding", "utf-8");
            transformer.transform(source, result);

        } catch (TransformerConfigurationException e) {
            e.printStackTrace();
        } catch (TransformerException e) {
            e.printStackTrace();
        }
    }
}
