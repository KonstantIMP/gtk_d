module pango.PgAttributeLanguage;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import pango.PgAttribute;
private import pango.PgLanguage;
private import pango.c.functions;
public  import pango.c.types;


/**
 * The `PangoAttrLanguage` structure is used to represent attributes that
 * are languages.
 */
public class PgAttributeLanguage : PgAttribute
{
	/** the main Gtk struct */
	protected PangoAttrLanguage* pangoAttrLanguage;

	/** Get the main Gtk struct */
	public PangoAttrLanguage* getPgAttributeLanguageStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return pangoAttrLanguage;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)pangoAttrLanguage;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (PangoAttrLanguage* pangoAttrLanguage, bool ownedRef = false)
	{
		this.pangoAttrLanguage = pangoAttrLanguage;
		super(cast(PangoAttribute*)pangoAttrLanguage, ownedRef);
	}


	/**
	 * Create a new language tag attribute.
	 *
	 * Params:
	 *     language = language tag
	 *
	 * Returns: the newly allocated `PangoAttribute`,
	 *     which should be freed with [method@Pango.Attribute.destroy].
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(PgLanguage language)
	{
		auto __p = pango_attr_language_new((language is null) ? null : language.getPgLanguageStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(PangoAttrLanguage*) __p);
	}
}
