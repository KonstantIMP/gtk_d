module atk.HypertextIF;

private import atk.Hyperlink;
private import atk.c.functions;
public  import atk.c.types;
private import gobject.ObjectG;
private import gobject.Signals;
private import std.algorithm;


/**
 * An interface used for objects which implement linking between
 * multiple resource or content locations, or multiple 'markers'
 * within a single document.  A Hypertext instance is associated with
 * one or more Hyperlinks, which are associated with particular
 * offsets within the Hypertext's included content.  While this
 * interface is derived from Text, there is no requirement that
 * Hypertext instances have textual content; they may implement Image
 * as well, and Hyperlinks need not have non-zero text offsets.
 */
public interface HypertextIF{
	/** Get the main Gtk struct */
	public AtkHypertext* getHypertextStruct(bool transferOwnership = false);

	/** the main Gtk struct as a void* */
	protected void* getStruct();


	/** */
	public static GType getType()
	{
		return atk_hypertext_get_type();
	}

	/**
	 * Gets the link in this hypertext document at index
	 * @link_index
	 *
	 * Params:
	 *     linkIndex = an integer specifying the desired link
	 *
	 * Returns: the link in this hypertext document at
	 *     index @link_index
	 */
	public Hyperlink getLink(int linkIndex);

	/**
	 * Gets the index into the array of hyperlinks that is associated with
	 * the character specified by @char_index.
	 *
	 * Params:
	 *     charIndex = a character index
	 *
	 * Returns: an index into the array of hyperlinks in @hypertext,
	 *     or -1 if there is no hyperlink associated with this character.
	 */
	public int getLinkIndex(int charIndex);

	/**
	 * Gets the number of links within this hypertext document.
	 *
	 * Returns: the number of links within this hypertext document
	 */
	public int getNLinks();

	/**
	 * The "link-selected" signal is emitted by an AtkHyperText
	 * object when one of the hyperlinks associated with the object
	 * is selected.
	 *
	 * Params:
	 *     arg1 = the index of the hyperlink which is selected
	 */
	gulong addOnLinkSelected(void delegate(int, HypertextIF) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0);
}
