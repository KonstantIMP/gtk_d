module atk.HypertextT;

public  import atk.Hyperlink;
public  import atk.c.functions;
public  import atk.c.types;
public  import gobject.ObjectG;
public  import gobject.Signals;
public  import std.algorithm;


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
public template HypertextT(TStruct)
{
	/** Get the main Gtk struct */
	public AtkHypertext* getHypertextStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return cast(AtkHypertext*)getStruct();
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
	public Hyperlink getLink(int linkIndex)
	{
		auto __p = atk_hypertext_get_link(getHypertextStruct(), linkIndex);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Hyperlink)(cast(AtkHyperlink*) __p);
	}

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
	public int getLinkIndex(int charIndex)
	{
		return atk_hypertext_get_link_index(getHypertextStruct(), charIndex);
	}

	/**
	 * Gets the number of links within this hypertext document.
	 *
	 * Returns: the number of links within this hypertext document
	 */
	public int getNLinks()
	{
		return atk_hypertext_get_n_links(getHypertextStruct());
	}

	/**
	 * The "link-selected" signal is emitted by an AtkHyperText
	 * object when one of the hyperlinks associated with the object
	 * is selected.
	 *
	 * Params:
	 *     arg1 = the index of the hyperlink which is selected
	 */
	gulong addOnLinkSelected(void delegate(int, HypertextIF) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "link-selected", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
