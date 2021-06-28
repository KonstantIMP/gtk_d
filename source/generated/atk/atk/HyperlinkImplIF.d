module atk.HyperlinkImplIF;

private import atk.Hyperlink;
private import atk.c.functions;
public  import atk.c.types;
private import gobject.ObjectG;


/**
 * AtkHyperlinkImpl allows AtkObjects to refer to their associated
 * AtkHyperlink instance, if one exists.  AtkHyperlinkImpl differs
 * from AtkHyperlink in that AtkHyperlinkImpl is an interface, whereas
 * AtkHyperlink is a object type.  The AtkHyperlinkImpl interface
 * allows a client to query an AtkObject for the availability of an
 * associated AtkHyperlink instance, and obtain that instance.  It is
 * thus particularly useful in cases where embedded content or inline
 * content within a text object is present, since the embedding text
 * object implements AtkHypertext and the inline/embedded objects are
 * exposed as children which implement AtkHyperlinkImpl, in addition
 * to their being obtainable via AtkHypertext:getLink followed by
 * AtkHyperlink:getObject.
 * 
 * The AtkHyperlinkImpl interface should be supported by objects
 * exposed within the hierarchy as children of an AtkHypertext
 * container which correspond to "links" or embedded content within
 * the text.  HTML anchors are not, for instance, normally exposed
 * this way, but embedded images and components which appear inline in
 * the content of a text object are. The AtkHyperlinkIface interface
 * allows a means of determining which children are hyperlinks in this
 * sense of the word, and for obtaining their corresponding
 * AtkHyperlink object, from which the embedding range, URI, etc. can
 * be obtained.
 * 
 * To some extent this interface exists because, for historical
 * reasons, AtkHyperlink was defined as an object type, not an
 * interface.  Thus, in order to interact with AtkObjects via
 * AtkHyperlink semantics, a new interface was required.
 */
public interface HyperlinkImplIF{
	/** Get the main Gtk struct */
	public AtkHyperlinkImpl* getHyperlinkImplStruct(bool transferOwnership = false);

	/** the main Gtk struct as a void* */
	protected void* getStruct();


	/** */
	public static GType getType()
	{
		return atk_hyperlink_impl_get_type();
	}

	/**
	 * Gets the hyperlink associated with this object.
	 *
	 * Returns: an AtkHyperlink object which points to this
	 *     implementing AtkObject.
	 *
	 * Since: 1.12
	 */
	public Hyperlink getHyperlink();
}
