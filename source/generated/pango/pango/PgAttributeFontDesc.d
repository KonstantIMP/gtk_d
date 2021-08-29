module pango.PgAttributeFontDesc;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import pango.PgAttribute;
private import pango.PgFontDescription;
private import pango.c.functions;
public  import pango.c.types;


/**
 * The `PangoAttrFontDesc` structure is used to store an attribute that
 * sets all aspects of the font description at once.
 */
public class PgAttributeFontDesc : PgAttribute
{
	/** the main Gtk struct */
	protected PangoAttrFontDesc* pangoAttrFontDesc;

	/** Get the main Gtk struct */
	public PangoAttrFontDesc* getPgAttributeFontDescStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return pangoAttrFontDesc;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)pangoAttrFontDesc;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (PangoAttrFontDesc* pangoAttrFontDesc, bool ownedRef = false)
	{
		this.pangoAttrFontDesc = pangoAttrFontDesc;
		super(cast(PangoAttribute*)pangoAttrFontDesc, ownedRef);
	}


	/**
	 * Create a new font description attribute.
	 *
	 * This attribute allows setting family, style, weight, variant,
	 * stretch, and size simultaneously.
	 *
	 * Params:
	 *     desc = the font description
	 *
	 * Returns: the newly allocated
	 *     `PangoAttribute`, which should be freed with
	 *     [method@Pango.Attribute.destroy]
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(PgFontDescription desc)
	{
		auto __p = pango_attr_font_desc_new((desc is null) ? null : desc.getPgFontDescriptionStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(PangoAttrFontDesc*) __p);
	}
}
