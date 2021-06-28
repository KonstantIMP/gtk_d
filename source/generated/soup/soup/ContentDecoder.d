module soup.ContentDecoder;

private import gobject.ObjectG;
private import soup.SessionFeatureIF;
private import soup.SessionFeatureT;
private import soup.c.functions;
public  import soup.c.types;


/** */
public class ContentDecoder : ObjectG, SessionFeatureIF
{
	/** the main Gtk struct */
	protected SoupContentDecoder* soupContentDecoder;

	/** Get the main Gtk struct */
	public SoupContentDecoder* getContentDecoderStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return soupContentDecoder;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)soupContentDecoder;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (SoupContentDecoder* soupContentDecoder, bool ownedRef = false)
	{
		this.soupContentDecoder = soupContentDecoder;
		super(cast(GObject*)soupContentDecoder, ownedRef);
	}

	// add the SessionFeature capabilities
	mixin SessionFeatureT!(SoupContentDecoder);


	/** */
	public static GType getType()
	{
		return soup_content_decoder_get_type();
	}
}
