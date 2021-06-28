module soup.WebsocketExtensionManager;

private import gobject.ObjectG;
private import soup.SessionFeatureIF;
private import soup.SessionFeatureT;
private import soup.c.functions;
public  import soup.c.types;


/** */
public class WebsocketExtensionManager : ObjectG, SessionFeatureIF
{
	/** the main Gtk struct */
	protected SoupWebsocketExtensionManager* soupWebsocketExtensionManager;

	/** Get the main Gtk struct */
	public SoupWebsocketExtensionManager* getWebsocketExtensionManagerStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return soupWebsocketExtensionManager;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)soupWebsocketExtensionManager;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (SoupWebsocketExtensionManager* soupWebsocketExtensionManager, bool ownedRef = false)
	{
		this.soupWebsocketExtensionManager = soupWebsocketExtensionManager;
		super(cast(GObject*)soupWebsocketExtensionManager, ownedRef);
	}

	// add the SessionFeature capabilities
	mixin SessionFeatureT!(SoupWebsocketExtensionManager);


	/** */
	public static GType getType()
	{
		return soup_websocket_extension_manager_get_type();
	}
}
